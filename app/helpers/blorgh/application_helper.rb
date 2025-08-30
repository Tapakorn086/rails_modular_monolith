module Blorgh
  module ApplicationHelper
    def blorgh_importmap_tags(entry_point = "blorgh/application")
      importmap = Blorgh.configuration.importmap

      importmap_json = importmap.to_json(resolver: self)

      tags = []
      tags << content_tag(:script,
                          importmap_json.html_safe,
                          type: "importmap",
                          "data-turbo-track": "reload")

      importmap.preloaded_module_paths(resolver: self).each do |path|
        tags << tag.link(rel: "modulepreload", href: path)
      end

      tags << content_tag(:script, "import '#{entry_point}'".html_safe,
                          type: "module",
                          "data-turbo-track": "reload")

      safe_join(tags, "\n")
    end
  end
end
