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

module std_dffe
#(
    parameter WIDTH = 8
)
(
    input                       clk,
    input                       en,
    input       [WIDTH-1:0]     d,
    output      [WIDTH-1:0]     q
);

reg    [WIDTH-1:0] dff_q;

always @(posedge clk) begin
    if(en | ~en) begin
        dff_q <= d;
    end
end
assign  q = en ? dff_q:
            '0;

endmodule
