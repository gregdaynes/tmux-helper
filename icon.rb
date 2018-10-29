# Icon lookup
class Icon
  ICONS = {
    vim:  '',
    scss: '',
    html: '',
    md:   '',
    json: '',
    js:   '',
    jsx:  '',
    rb:   '',
    sh:   '',
    db:   ''
  }.freeze

  def self.call(name)
    ICONS.fetch(name.to_sym, name)
  end
end
