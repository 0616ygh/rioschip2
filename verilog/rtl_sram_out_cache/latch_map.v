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
module \$_DLATCH_P_ (input E, input D, output Q);
  gf180mcu_fd_sc_mcu7t5v0__latq_1 _TECHMAP_DLATCH_P (
    //# {{data|Data Signals}}
    .D(D),
    .Q(Q),

    //# {{clocks|Clocking}}
    .GATE(E)
  );
endmodule

module \$_DLATCH_N_ (input E, input D, output Q);
  gf180mcu_fd_sc_mcu7t5v0__latrnq_1 _TECHMAP_DLATCH_N (
    //# {{data|Data Signals}}
    .D(D),
    .Q(Q),

    //# {{clocks|Clocking}}
    .GATE_N(E)
  );
endmodule
