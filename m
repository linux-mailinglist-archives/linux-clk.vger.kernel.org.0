Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 147D43DC0A7
	for <lists+linux-clk@lfdr.de>; Sat, 31 Jul 2021 00:02:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231984AbhG3WC3 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 30 Jul 2021 18:02:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231215AbhG3WC3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 30 Jul 2021 18:02:29 -0400
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it [IPv6:2001:4b7a:2000:18::165])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 204E6C061765
        for <linux-clk@vger.kernel.org>; Fri, 30 Jul 2021 15:02:24 -0700 (PDT)
Received: from TimeMachine.lan (bband-dyn19.178-41-181.t-com.sk [178.41.181.19])
        by m-r1.th.seeweb.it (Postfix) with ESMTPA id 4EAF2202E6;
        Sat, 31 Jul 2021 00:02:22 +0200 (CEST)
From:   Martin Botka <martin.botka@somainline.org>
To:     martin.botka1@gmail.com
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        konrad.dybcio@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        paul.bouchara@somainline.org,
        Martin Botka <martin.botka@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/1] RPMCC for SM6125
Date:   Fri, 30 Jul 2021 23:59:23 +0200
Message-Id: <20210730215924.733350-1-martin.botka@somainline.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This patch adds support for the
RPMCC found in SM6125 SoC.

I did not include patches that were already merged.

Changes in v2:
Add commit description to all the patches

Changes in v3:
Drop merged patches
Squash adding compatible
Deduplicate clocks
Nicer commit message
Use defined but prev not used clocks using the
recently added dt-binding for them (In linux-next)
Sort sm6125 clocks according to their
ID in qcom,rpmcc.h

Martin Botka (3):
  clk: qcom: smd: Add support for SM6125 rpm clocks

 drivers/clk/qcom/clk-smd-rpm.c   | 56 ++++++++++++++++++++++++++++++++
 include/linux/soc/qcom/smd-rpm.h |  1 +
 2 files changed, 57 insertions(+)

-- 
2.32.0

