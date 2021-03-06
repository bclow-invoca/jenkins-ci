#
# Cookbook Name:: jenkins_ci
# Recipe:: jobs
#
# Adds jobs in Jenkins for testing our cookbooks
#
# Copyright (C) 2013 Zachary Stevens
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

node['jenkins_ci']['jenkins']['job'].each do |_job, options|
  cookbook_ci options['name'] do
    repository options['repository']
    branch options['branch']
    foodcritic options['foodcritic']
    chefspec options['chefspec']
    serverspec options['serverspec']
    junit_results options['junit_results']
    command options['command']
    action :create
  end
end
