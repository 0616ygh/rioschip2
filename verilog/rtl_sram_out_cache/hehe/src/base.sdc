# SPDX-FileCopyrightText: 2022 RIOSLab
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http:#www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# SPDX-License-Identifier: Apache-2.0
###############################################################################
# Created by write_sdc
# Wed Nov 10 17:01:46 2021
###############################################################################
current_design hehe
###############################################################################
# Timing Constraints
###############################################################################
create_clock -name clk -period 15.0000 [get_ports {clk}]
set_propagated_clock [get_clocks {clk}]


###############################################################################
# Design Rules
###############################################################################
