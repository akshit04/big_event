class JobStatusController < ApplicationController

  def show
    all_status = ::Job.all_status()
    status_counts = Hash.new
    all_status.each do |status|
      if status_counts[status]
        status_counts[status] += 1
      else
        status_counts[status] = 1
      end
    end
    @status_graph = hash_to_a(status_counts)
  end

  def hash_to_a(hash)
    hash.map do |k, v|
      [k, v]
    end
  end

end