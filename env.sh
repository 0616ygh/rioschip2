# SPDX-FileCopyrightText: 2022 RIOSLab
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# SPDX-License-Identifier: Apache-2.0
export OPENLANE_ROOT=$(pwd)/dependencies/openlane_src # you need to export this whenever you start a new shell
export PDK_ROOT=$(pwd)/dependencies/pdks # you need to export this whenever you start a new shell
# export the PDK variant depending on your shuttle, if you don't know leave it to the default
# for the gf180 GFMPW shuttles...
export PDK=gf180mcuC
export CARAVEL_ROOT=$(pwd)/caravel