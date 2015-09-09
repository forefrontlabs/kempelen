require "kempelen/version"

require "kempelen/API/client"

require "kempelen/API/common/price"

require "kempelen/API/responses/base"
require "kempelen/API/responses/error_response"
require "kempelen/API/responses/empty_response"
require "kempelen/API/responses/hit_response"
require "kempelen/API/responses/account_balance_response"
require "kempelen/API/responses/reviewable_hits_response"

require "kempelen/API/operations/base"
require "kempelen/API/operations/parameters"
require "kempelen/API/operations/hit_operation"
require "kempelen/API/operations/assignment_operation"
require "kempelen/API/operations/create_hit"
require "kempelen/API/operations/get_hit"
require "kempelen/API/operations/get_reviewable_hits"
require "kempelen/API/operations/get_account_balance"
require "kempelen/API/operations/force_expire_hit"
require "kempelen/API/operations/approve_assignment"
require "kempelen/API/operations/reject_assignment"
require "kempelen/API/operations/get_assignments_for_hit"
require "kempelen/API/operations/set_hit_as_reviewing"
require "kempelen/API/operations/register_hit_type"

module Kempelen
  # Your code goes here...
end
