// SPDX-FileCopyrightText: 2022 RIOSLab
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
// SPDX-License-Identifier: Apache-2.0
/////////////////////////
// Author: Peichen Guo //
//    RIOS Lab work    //
//      HeHe Core      //
/////////////////////////
`ifndef AGU_V
`define AGU_V
`include "../params.vh"
/*verilator lint_off UNUSED */
module agu (

    input [XLEN - 1 : 0] base_i,
    input [XLEN - 1 : 0] offset_i,

    output [VIRTUAL_ADDR_LEN - 1 : 0] addr_o
);
    assign addr_o = base_i[VIRTUAL_ADDR_LEN - 1 : 0] + offset_i[VIRTUAL_ADDR_LEN - 1 : 0];
endmodule
/*verilator lint_on UNUSED */
`endif // AGU_V
