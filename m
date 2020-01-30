Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2553414E499
	for <lists+linux-clk@lfdr.de>; Thu, 30 Jan 2020 22:13:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727635AbgA3VNd (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 30 Jan 2020 16:13:33 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:37349 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727882AbgA3VNB (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 30 Jan 2020 16:13:01 -0500
Received: by mail-pj1-f65.google.com with SMTP id m13so1886434pjb.2
        for <linux-clk@vger.kernel.org>; Thu, 30 Jan 2020 13:13:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EhLkjJnc7Tvg6c+D+i1atdDK7ul7OoMcFLbEV57smwA=;
        b=YACiuw3I6aQW0okCZOZkbpI2LnSUUT86cYe3PTxGtY1G13lrknoeNOR2rW5w5eOray
         ZZ2JTVB/LmgPEBfvXGBqo39b8Qkg6WJIwUB+a9Yube+JSCvieaBgBoPpPfRoshZiJ6Xt
         Z7qK51vcg20SjzF2Bx9aXYpj5/suCssdR4bZ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EhLkjJnc7Tvg6c+D+i1atdDK7ul7OoMcFLbEV57smwA=;
        b=tZheXBKVS6NX2yiJWTWNYnbzKDLY8dSxjbo23aBXtJ1L2TPIhuOyPjCpfVz5KUqPCq
         Ow2yPRbn8i8mEGn62tzDuc56LIMMq4uUROpLEiDxxWUBPQMIyyX7xzbw3UIjvftpZhhG
         rB8Cpq+taUJEm3NxGD8XhyZi1WabdGqLrQfkoLMQGtUJAJPunM+wl/dX32vIEAgGoFEX
         5/0QsQSKOn/t+i6HPWR/fWKSbS//UkfcNC/eAMimWbsfiwslcw6R5Nwqil5rVhl9DGhl
         ffnVklL0aXkUTaN0Y+4KqZEYSYxckIOPtGdafSiPtc2B43nFY/6diK2PTAbSV9rA7BFb
         Mhyw==
X-Gm-Message-State: APjAAAWO6XYZ47W62kJuzLoGKoqsLVtW95Ax9pO46ZjGvcxk+QXw57PM
        iiPGg+uza8ymlghBANCUy/ZkSA==
X-Google-Smtp-Source: APXvYqyNswtUeRfxu8pkGT+lb94+9OrthlA8QLayMFGUxze8/lozqOfD3iWfnthyHmjjkmKqN5OnLQ==
X-Received: by 2002:a17:90a:8915:: with SMTP id u21mr8226951pjn.87.1580418780837;
        Thu, 30 Jan 2020 13:13:00 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id ci5sm4343871pjb.5.2020.01.30.13.12.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2020 13:13:00 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Rob Herring <robh@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Jeffrey Hugo <jhugo@codeaurora.org>,
        Taniya Das <tdas@codeaurora.org>, jeffrey.l.hugo@gmail.com,
        linux-arm-msm@vger.kernel.org, harigovi@codeaurora.org,
        devicetree@vger.kernel.org, mka@chromium.org,
        kalyan_t@codeaurora.org, Mark Rutland <mark.rutland@arm.com>,
        linux-clk@vger.kernel.org, hoegsberg@chromium.org,
        Douglas Anderson <dianders@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 10/15] clk: qcom: Use ARRAY_SIZE in gpucc-sc7180 for parent clocks
Date:   Thu, 30 Jan 2020 13:12:26 -0800
Message-Id: <20200130131220.v3.10.I3bf44e33f4dc7ecca10a50dbccb7dc082894fa59@changeid>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
In-Reply-To: <20200130211231.224656-1-dianders@chromium.org>
References: <20200130211231.224656-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

It's nicer to use ARRAY_SIZE instead of hardcoding.  Had we always
been doing this it would have prevented a previous bug.  See commit
74c31ff9c84a ("clk: qcom: gpu_cc_gmu_clk_src has 5 parents, not 6").

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v3:
- Patch ("clk: qcom: Use ARRAY_SIZE in gpucc-sc7180...") split out for v3.

Changes in v2: None

 drivers/clk/qcom/gpucc-sc7180.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gpucc-sc7180.c b/drivers/clk/qcom/gpucc-sc7180.c
index c88f00125775..a96c0b945de2 100644
--- a/drivers/clk/qcom/gpucc-sc7180.c
+++ b/drivers/clk/qcom/gpucc-sc7180.c
@@ -84,7 +84,7 @@ static struct clk_rcg2 gpu_cc_gmu_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gpu_cc_gmu_clk_src",
 		.parent_data = gpu_cc_parent_data_0,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(gpu_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_shared_ops,
 	},
-- 
2.25.0.341.g760bfbb309-goog

