import path from "path";
import type { Configuration } from "webpack";
import WebpackAssetsManifest from "webpack-assets-manifest";

const { NODE_ENV } = process.env;
const isProd = NODE_ENV === "production";

const config: Configuration = {
    mode: isProd ? "production" : "development",
  devtool: "source-map",
  entry: {
    application: path.resolve(__dirname, "app/javascript/application.js")
  },
  output: {
    path: path.resolve(__dirname, "public/packs"),
    publicPath: "/packs/",
    filename: isProd ? "[name]-[hash].js" : "[name].js"
  },
  resolve: {
    extensions: [".js"]
  },
  plugins: [new WebpackAssetsManifest({ publicPath: true })]
};

export default config;
