import 'w2ui';

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

$.ajax("/home/search.json")
.then((data: Issue[]) => {
  $("#grid").w2grid({
    columns: [
      { field: "id" }
    ],
    records: data
  });
  console.log(w2ui);
})
.fail((e) => console.error(e))
