RSpec.configure do |config|
  # This will run after every test to delete records in the test_db
  config.before(:each) do
    DatabaseCleaner[:active_record].strategy = :truncation, { pre_count: true }
  end

  config.before(:each, js: true) do
    DatabaseCleaner[:active_record].strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner[:active_record].start
  end

  config.after(:each) do
    DatabaseCleaner[:active_record].clean
  end
end
