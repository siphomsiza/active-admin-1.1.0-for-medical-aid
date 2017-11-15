module ActiveAdmin
  module Views

    class SiteTitle < Component

      def tag_name
        'div'
      end

      def build(namespace)
        super(id: "site_title")
        @namespace = namespace
        @site_title_navigation_menu = @namespace.fetch_menu(:site_title_navigation)

        div class: "tob-bar-logo" do
          if site_title_link?
            text_node site_title_with_link
          else
            text_node site_title_content
          end
        end
        # if site_title_navigation?
          div class: "site-title-navigation header",id: 'top_header' do
            build_site_title_navigation
          end
        # end
      end

      def site_title_link?
        @namespace.site_title_link.present?
      end

      def site_title_image?
        @namespace.site_title_image.present?
      end

      def site_title_navigation?
        @namespace.site_title_navigation.present?
      end

      def build_site_title_navigation
        insert_tag view_factory.site_title_navigation, @site_title_navigation_menu, class: 'header-item tabs'
      end

      private

      def site_title_with_link
        helpers.link_to(site_title_content, @namespace.site_title_link)
      end

      def site_title_content
        if site_title_image?
          title_image
        else
          title_text
        end
      end

      def title_text
        helpers.render_or_call_method_or_proc_on(helpers, @namespace.site_title)
      end

      def title_image
        path = helpers.render_or_call_method_or_proc_on(helpers, @namespace.site_title_image)
        helpers.image_tag(path, id: "site_title_image", alt: title_text)
      end

    end

  end
end
