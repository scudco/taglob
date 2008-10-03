require 'spec/spec_helper'
require 'taglob/rake'
describe Taglob::Rake::CheckTagsTask do
  it "should raise error if invalid tags present"
  it "should not raise error if only valid tags present"
end