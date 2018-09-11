const { environment } = require("@rails/webpacker");
const webpack = require("webpack");

// resolve-url-loader must be used before sass-loader
environment.loaders.get("sass").use.splice(-1, 0, {
  loader: "resolve-url-loader"
});

environment.plugins.append(
  "Provide",
  new webpack.ProvidePlugin({
    $: "jquery",
    jQuery: "jquery",
    "window.jQuery": "jquery",
    Popper: ["popper.js", "default"]
  })
);

environment.loaders.get("file").append(
  {
    loader: "url-loader",
    options: {
      limit: 8000, // Convert images < 8kb to base64 strings
      name: "images/[hash]-[name].[ext]"
    }
  }
);

module.exports = environment;

console.log(environment.loaders.get("file"));
