module PeopleHelper
  def person_enrollment
    if action_name == 'new' || action_name == 'create'
      @person.enrollments.detect(&:new_record?) || @person.enrollments.build
    else
      @person.enrollments
    end
  end

  def with_notebook_enrollment_select(form)
    collection = [
      [t('view.enrollments.without_notebook'), false],
      [t('view.enrollments.with_notebook'), true]
    ]

    form.input :with_notebook, collection: collection, prompt: false, 
      label: false, selected: form.object.try(:with_notebook)
  end

  def color_chooser_for_notebook(num)
    if num >= 15 && num < 20
      'warning'
    elsif num >= 20
      'error'
    else
      'info'
    end
  end
end
