namespace :obsolete do
  desc "TODO"
  task mark_obsolete: :environment do
    Ad.mark_obsolete_to_true_running_method
  end

end
