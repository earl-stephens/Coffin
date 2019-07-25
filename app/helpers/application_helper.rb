module ApplicationHelper
  def intervals
    [
      ['Days'],
      ['Months'],
      ['Years'],
    ]
  end

  def burial_cremation
    [
      ['Burial'],
      ['Cremation']
    ]
  end

  def type_of_service
    [
      ['Traditional funeral'],
      ['A Committal (or Graveside) Service'],
      ['Cremation'],
      ['Green and woodland funerals'],
      ['Humanist and civic funerals'],
      ['Burial at sea'],
      ['A Memorial Service'],
      ['Christian'],
      ['Jewish'],
      ['Islamic'],
      ['Buddhist'],
      ['Hindu']
    ]
  end
end
