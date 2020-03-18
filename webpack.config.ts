import path from "path";
import type { Configuration } from "webpack";
import { ProvidePlugin } from "webpack";
import WebpackAssetsManifest from "webpack-assets-manifest";
import glob from "glob";

const { NODE_ENV } = process.env;
const isProd = NODE_ENV === "production";

const entries: { [key: string]: string } = {};
glob.sync("app/javascript/packs/*.ts").forEach(filePath => {
  const name = path.basename(filePath, path.extname(filePath));
  entries[name] = path.resolve(__dirname, filePath);
});

const config: Configuration = {
  mode: isProd ? "production" : "development",
  devtool: isProd ? "source-map" : "inline-source-map",
  entry: entries,
  output: {
    path: path.resolve(__dirname, "public/packs"),
    publicPath: isProd ? "/packs/" : "//localhost:8081/packs/",
    filename: isProd ? "[name]-[hash].js" : "[name].js"
  },
  resolve: {
    extensions: [".js", ".ts"]
  },
  plugins: [
    new WebpackAssetsManifest({ publicPath: true, writeToDisk: true }),
    new ProvidePlugin({ $: "jquery", jQuery: "jquery"}),
  ],
  module: {
    rules: [
      {
        test: /\.tsx?$/,
        use: ["babel-loader"]
      }
    ]
  },
  devServer: {
    host: '0.0.0.0',
    port: 8081,
    contentBase: path.resolve(__dirname, "public"),
    publicPath: "/packs/",
    headers: {
      "Access-Control-Allow-Origin": "*"
    }
  }
};

export default config;
