# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard 'rspec', :spec_paths => ['spec/flightstats'] do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^spec/flightstats/.+_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$})     { |m| "spec/#{m[1]}_spec.rb" }
  watch(%r{^lib/flightstats/(.+)\.rb$})     { |m| "spec/#{m[1]}_spec.rb" }
  watch(%r{^lib/flightstats/api/(.+)\.rb$})     { |m| "spec/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb')  { "spec" }
end