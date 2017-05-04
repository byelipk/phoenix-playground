defmodule Playground.PageView do
  use Playground.Web, :view

  def render("scripts.index.html", _assigns) do
    ~E"""
    <script>
      require("web/static/js/page/index").Page.run();
    </script>
    """
  end

  def render("scripts.downloads.html", _assigns) do
    ~E"""
    <script>
      require("web/static/js/page/downloads").Page.run();
    </script>
    """
  end

  def render("scripts.download.html", assigns) do
    ~E"""
    <script>
      require("web/static/js/page/download").Page.run(
        "<%= assigns[:pdf_path] %>"
      );
    </script>
    """
  end
end
