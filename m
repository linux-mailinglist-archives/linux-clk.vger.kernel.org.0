Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA380150F74
	for <lists+linux-clk@lfdr.de>; Mon,  3 Feb 2020 19:32:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730011AbgBCSca (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 3 Feb 2020 13:32:30 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:35380 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729989AbgBCSca (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 3 Feb 2020 13:32:30 -0500
Received: by mail-pf1-f196.google.com with SMTP id y73so8018009pfg.2
        for <linux-clk@vger.kernel.org>; Mon, 03 Feb 2020 10:32:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Jo0olqgMnkzurEg4dWqwCBwLi+N2wWcbXWJXOIPzme8=;
        b=nYUJygIUSbVTXhXFO7+qNnTNnfukf5txscppTz+MTPVZ4oFv8iXEP9AkclCpjSHewY
         XScnMbFGsaAUEa016ps6Q2v6Ivmcqffkepe0FN9stFAbXRmw7UOMx50mpNzqQdtuvO9p
         B/yff2fq5OPRcUgalVaEDfWwTZXZ/R520zizk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Jo0olqgMnkzurEg4dWqwCBwLi+N2wWcbXWJXOIPzme8=;
        b=Lv6Bj12HYlFScPdPfMw5D8f0Klrp4+FDPPiTne80+pwed8UesmkMkKZklEGoXKC7AT
         vAyouJUz0ghdaxKZ9wxNA8DJGvM4gcVSHZ9masBcSRGKWhmpD9sZOPX2uFWesB0QLtzo
         1j97sKezz9wo0ymvlbl1u6NuAEvWwGKjFl0TB9dKHuGH95OlHUMmp6HkAG8qithfhQ6w
         R4KPImY8Qv/k3gxUMNNgiNenRo4KFrVw4OTUwisY9xuFocLFwdQb2PdGSwF6bsa9gITO
         k/YeyyTNCFn8nIbfC2jQNmNx7samLB+8bcELsvoB73MzTl7poCUAcm7Cv1AHqCqf+FxK
         EEGw==
X-Gm-Message-State: APjAAAWs2zOQMQemk35bw2luRLOJSvpg8l8qnxV2rU8yvkaiEtBFgniu
        nnWfWXKXAJz67vH0H7mxcDhJLA==
X-Google-Smtp-Source: APXvYqxhWhgChXoUPvOD81GXdBg/j2G+GZuWLcUcvqFxA4nxIp7F10nCV9y5Pk48VXZ+rxgns3JLQQ==
X-Received: by 2002:a63:e545:: with SMTP id z5mr26100199pgj.209.1580754748647;
        Mon, 03 Feb 2020 10:32:28 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id f9sm21009137pfd.141.2020.02.03.10.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2020 10:32:28 -0800 (PST)
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
Subject: [PATCH v4 13/15] clk: qcom: Use ARRAY_SIZE in videocc-sc7180 for parent clocks
Date:   Mon,  3 Feb 2020 10:31:46 -0800
Message-Id: <20200203103049.v4.13.If37e4b1b5553ac9db5ea51e84a6eec286cdf209e@changeid>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
In-Reply-To: <20200203183149.73842-1-dianders@chromium.org>
References: <20200203183149.73842-1-dianders@chromium.org>
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

Changes in v4: None
Changes in v3:
- Patch ("clk: qcom: Use ARRAY_SIZE in videocc-sc7180...") new for v3.

Changes in v2: None

 drivers/clk/qcom/videocc-sc7180.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/videocc-sc7180.c b/drivers/clk/qcom/videocc-sc7180.c
index 653fc4e6bb6f..c363c3cc544e 100644
--- a/drivers/clk/qcom/videocc-sc7180.c
+++ b/drivers/clk/qcom/videocc-sc7180.c
@@ -76,7 +76,7 @@ static struct clk_rcg2 video_cc_venus_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "video_cc_venus_clk_src",
 		.parent_data = video_cc_parent_data_1,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(video_cc_parent_data_1),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_shared_ops,
 	},
-- 
2.25.0.341.g760bfbb309-goog

