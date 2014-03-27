module PaginationHelper
  def pagination_links objects, params = nil
    pagination_links = will_paginate objects,
      inner_window: 1, outer_window: 1, params: params,
      renderer: BootstrapPaginationHelper::LinkRenderer,
      class: 'pagination pagination-sm pull-right'
    page_entries = content_tag(:div,
      content_tag(:small,
        page_entries_info(objects),
        class: 'page-entries text-muted'
      ),
      class: 'hidden-lg pull-right'
    )

    pagination_links ||= ''.html_safe

    content_tag :div, pagination_links + page_entries, class: 'pagination-container'
  end
end
