class TransactionPresenter < BasePresenter
  def amount
    "EUR. #{sprintf("%.2f", @model.amount)}"
  end

  def created_at
    I18n.l @model.created_at, format: :long
  end
end
