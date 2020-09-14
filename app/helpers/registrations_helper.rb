module RegistrationsHelper
  def set_action_button(run, user_id)
    run_user_registration = run.registrations.where(user_id: current_user.id)[0]
    if run_user_registration
      html = link_to 'Unregister', 'registrations/unregister/' + String(run.id),
                     method: :delete, data: { confirm: 'Are you sure?' }, class: 'btn btn-danger'
      html += if run_user_registration.confirmed
                ' <strong class="text-success">You place is confirmed</strong>'.html_safe
              else
                ' <strong class="text-warning">You are on the waiting list</strong>'.html_safe
              end
      html.html_safe
    else
      link_to 'Register', 'registrations/register/' + String(run.id), method: :post, class: 'btn btn-primary'
    end
  end
end


