import $ from 'jquery';

import '../resolve-w2ui';

interface W2uiRecord {
  recid: number;
}

interface Issue {
  id: number;
  author_id: number;
  author_name: string;
  assigned_to_id: number;
  assigned_to_name: string;
  issue_category_id: number;
  issue_category_name: string;
  title: string;
  body: string;
}

function toW2uiRecode<T>(func: (t: T) => number): (t: T) => T & W2uiRecord {
  return (t) => ({ ...t, recid: func(t) })
}

function loadIssues(searchWord?: string): Promise<Issue[]> {
  return new Promise((resolve, reject) => {
    $.ajax({
      type: "GET",
      url: "/home/search.json",
      data: {
        ["search_word"]: searchWord,
      }
    })
    .then((data: Issue[]) => resolve(data))
    .fail((e) => reject(e));
  });
}

$(async () => {
  $.ajaxSetup({
    beforeSend: (xhr) => {
      xhr.setRequestHeader("X-CSRF-Token", $("meta[name='csrf-token']").attr("content"));
    },
  });

  const grid = $("#grid").w2grid({
    name: 'grid',
    columns: [
      { field: "recid", caption: "ID", size: "5%", sortable: true },
      { field: "title", caption: "Title", size: "25%", sortable: true, resizable: true },
      { field: "body", caption: "Body", size: "30%", sortable: true, resizable: true },
      { field: "author_name", caption: "Author", size: "20%", sortable: true, resizable: true },
      { field: "assigned_to_name", caption: "Assigned To", size: "20%", sortable: true, resizable: true },
    ],
    records: [],
    onClick: (e: { recid: number; }) => {
      location.href = `/issues/${e.recid}/edit`;
    },
  });
  const loadGrid = async () => {
    try {
      const issues = await loadIssues($("#search_word").val().toString());

      const records = issues.map(toW2uiRecode(issue => issue.id));
      grid.records = records;
      grid.reload();
    } catch (e) {
      console.error(e);
    }
  };

  await loadGrid();

  $("#search").on("click", async (e) => {
    e.preventDefault();
    await loadGrid();
  });
});
