Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC93B2F6DD1
	for <lists+linux-clk@lfdr.de>; Thu, 14 Jan 2021 23:12:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730465AbhANWME (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 14 Jan 2021 17:12:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730461AbhANWME (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 14 Jan 2021 17:12:04 -0500
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it [IPv6:2001:4b7a:2000:18::171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A8FDC0613C1
        for <linux-clk@vger.kernel.org>; Thu, 14 Jan 2021 14:11:09 -0800 (PST)
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 6FD843EB31;
        Thu, 14 Jan 2021 23:11:07 +0100 (CET)
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        martin.botka@somainline.org, phone-devel@vger.kernel.org,
        linux-kernel@vger.kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, robh+dt@kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Subject: [PATCH v2 00/11] Clock fixes for MSM8998 GCC, MMCC, GPUCC
Date:   Thu, 14 Jan 2021 23:10:48 +0100
Message-Id: <20210114221059.483390-1-angelogioacchino.delregno@somainline.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This patch series fixes some issues with the MSM8998 clocks and, in
particular, brings a very important fix to the GCC PLLs.

These fixes are enhancing this SoC's stability and also makes it
possible to eventually enable the Adreno GPU (with proper clock
scaling) and other components.

This patch series was tested on:
- Sony Xperia XZ Premium (MSM8998)
- F(x)Tec Pro1 (MSM8998)

AngeloGioacchino Del Regno (11):
  dt-bindings: clocks: gcc-msm8998: Add GCC_MMSS_GPLL0_CLK definition
  clk: qcom: gcc-msm8998: Wire up gcc_mmss_gpll0 clock
  dt-bindings: clock: gcc-msm8998: Add HMSS_GPLL0_CLK_SRC definition
  clk: qcom: gcc-msm8998: Add missing hmss_gpll0_clk_src clock
  clk: qcom: gcc-msm8998: Mark gpu_cfg_ahb_clk as critical
  clk: qcom: gcc-msm8998: Fix Alpha PLL type for all GPLLs
  clk: qcom: mmcc-msm8998: Set CLK_GET_RATE_NOCACHE to pixel/byte clks
  clk: qcom: mmcc-msm8998: Add hardware clockgating registers to some
    clks
  clk: qcom: mmcc-msm8998: Set bimc_smmu_gdsc always on
  clk: qcom: gpucc-msm8998: Add resets, cxc, fix flags on gpu_gx_gdsc
  clk: qcom: gpucc-msm8998: Allow fabia gpupll0 rate setting

 drivers/clk/qcom/gcc-msm8998.c               | 143 ++++++++++++-------
 drivers/clk/qcom/gpucc-msm8998.c             |  18 ++-
 drivers/clk/qcom/mmcc-msm8998.c              |  20 ++-
 include/dt-bindings/clock/qcom,gcc-msm8998.h |   2 +
 4 files changed, 125 insertions(+), 58 deletions(-)

-- 
2.29.2

