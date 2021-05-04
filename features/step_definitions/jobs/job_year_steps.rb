When "I am on the Job Year page" do
    redirect_to 'job_year/2021'
end

Then /I should see the job "(.*)"/ do |job|
    if page.respond_to? :should
        page.should have_content(job)
    else
        assert page.has_content?(job)
    end
end