guard 'rspec' do
  watch(%r{^spec/.+_spec\.rb$})
  watch('lib/liquor.rb') { "spec" }
  watch(%r{^lib/liquor/(.+)\.rb$}) { "spec" }
  watch('spec/spec_helper.rb') { "spec" }

  watch(%r{^lib/liquor/grammar/.+\.(rl|racc)$}) { `rake` }
  watch('doc/language-spec.md') do
    `rake doc/language-spec.html`
    Notifier.notify('Documentation was regenerated')
  end

  notification :libnotify
end
