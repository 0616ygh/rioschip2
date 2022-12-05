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
module fifo_tmp #(
    parameter FIFO_DATA_WIDTH = 5,
    parameter FIFO_SIZE = 32,
    parameter FIFO_SIZE_WIDTH = 5
) (
    input clk,
    input reset,
    input flush,
    input wr_en,
    input rd_en,
    input [FIFO_DATA_WIDTH-1:0] wdata,
    
    output reg [FIFO_DATA_WIDTH-1:0] rdata,
    output reg fifo_full,
    output reg fifo_empty,
    output reg [FIFO_SIZE_WIDTH-1:0] fifo_num    
);
    wire wr_cnt_flag;
    wire rd_cnt_flag;
    wire cnt_cmp_greater;
    wire cnt_cmp_equal;
    wire [FIFO_SIZE_WIDTH-1:0] rd_line;
    wire [FIFO_SIZE_WIDTH-1:0] wr_line;
    wire wr_line_end;
    wire rd_line_end;
    wire fifo_turn_arroud; //to show wr and rd both count over a fifo queue size
    reg fifo_recount; //to record wr count over a fifo queue size
    reg [FIFO_DATA_WIDTH-1:0] fifo_queue[FIFO_SIZE-1:0];
/* verilator lint_off WIDTH*/
    integer i;

    //write fifo
    always @(posedge clk) begin
        if (reset) begin
            for (i = 0; i < FIFO_SIZE; i = i + 1) begin
                fifo_queue[i] <= 0;
            end
        end else if (flush) begin
            for (i = 0; i < FIFO_SIZE; i = i + 1) begin
                fifo_queue[i] <= 0;
            end
        end else if (wr_cnt_flag) begin
            fifo_queue[wr_line] <= wdata;
        end
    end

    //read fifo
    always @(*) begin
        rdata = fifo_queue[rd_line];
    end

    //fifo number calculate
    always @(*) begin
        if (cnt_cmp_greater) begin
            fifo_num = wr_line - rd_line;
        end else if (cnt_cmp_equal) begin
            if (fifo_recount) begin
                fifo_num = FIFO_SIZE;
            end else begin
                fifo_num = 0;
            end
        end else begin
            fifo_num = FIFO_SIZE + wr_line - rd_line;
        end
    end

    assign cnt_cmp_greater = wr_line > rd_line;
    assign cnt_cmp_equal = wr_line == rd_line;

    always @(*) begin
        fifo_full = fifo_num == FIFO_SIZE;
    end

    always @(*) begin
        fifo_empty = fifo_num == 0;
    end
    
    //fifo recount
    always @(posedge clk) begin
        if (reset) begin
            fifo_recount <= 0;
        end else if (flush) begin
            fifo_recount <= 0;  
        end else if (wr_line_end) begin
            fifo_recount <= 1;
        end else if (fifo_turn_arroud) begin
            fifo_recount <= 0;
        end
    end

    assign fifo_turn_arroud = fifo_recount & rd_line_end;

    //write counter
    counter_tmp #(
        .CNT_SIZE(FIFO_SIZE),
        .CNT_SIZE_WIDTH(FIFO_SIZE_WIDTH)
    ) wr_cnt(
        .clk(clk),
        .reset(reset),
        .flush(flush),
        .cnt_add_flag(wr_cnt_flag),
        .cnt(wr_line),
        .cnt_end(wr_line_end)
    );

    assign wr_cnt_flag = wr_en & !fifo_full;

    //read counter
    counter_tmp #(
        .CNT_SIZE(FIFO_SIZE),
        .CNT_SIZE_WIDTH(FIFO_SIZE_WIDTH)
    ) rd_cnt(
        .clk(clk),
        .reset(reset),
        .flush(flush),
        .cnt_add_flag(rd_cnt_flag),
        .cnt(rd_line),
        .cnt_end(rd_line_end)
    );

    assign rd_cnt_flag = rd_en & !fifo_empty;

endmodule
