class SlimInput < SimpleForm::Inputs::Base
  def input
    type = options[:type] || :text_field

    @builder.send type, attribute_name, input_options
  end

  def label
    false
  end

  def input_html_classes
    super << 'form-control'
  end

  private

    def input_options
      {
        placeholder: raw_label_text,
        title: raw_label_text,
      }.deep_merge input_html_options
    end
end
