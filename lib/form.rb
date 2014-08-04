require 'reform'
require 'reform/form/coercion'

class Form < Reform::Form
  Coercion

  def validate(params, listener=nil)
    normalized_params = hash(params).stringify_keys
    return true if super(normalized_params)
    listener.form_invalid if listener
    false
  end

  def fill_with!(*args)
    validate(*args)
    sync if valid?
    model
  end

  private

  def hash(params)
    if params.kind_of?(Lotus::Action::Params)
      params.instance_eval{ @params }.dup
    else
      params
    end
  end
end
