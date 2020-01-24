Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0151D148D51
	for <lists+linux-clk@lfdr.de>; Fri, 24 Jan 2020 19:00:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391077AbgAXSAb (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 24 Jan 2020 13:00:31 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:33390 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390684AbgAXSAa (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 24 Jan 2020 13:00:30 -0500
Received: by mail-pl1-f193.google.com with SMTP id ay11so1110746plb.0
        for <linux-clk@vger.kernel.org>; Fri, 24 Jan 2020 10:00:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=V3/kmAeSuC3sr4iKKxqSQnU5UfmqOHV5XbVRzlbVZFI=;
        b=iGSYliDary7R2pl7OCfhsXq+Em5luh+C+cI5B+8AJAZeQ7+C9ga4wkRG/0fT7h4e/T
         vggRat7t16Pbg5udZSI5WYWVWv1vl+X+VohIXGCp4lV279h7Z8yjUPybmxl3ZN3mUkym
         Wp8WcvdeuVroMK3DHipmcIaXQEbymI4WR8SM69W3dHOMlzlVOi2LThZPEOUvNO2/bJBn
         aYQI8lic7G7yttjhPQoLUIHX1szhtyrOz1OjAfvug4bK9DATLG9k662ebLD+xsEAcCp0
         34IqjhHCqgWbkanVMWpPp0rjzwPQxLSYt5NCKijxkZ4R0zrtgTSLe1uOsQTcxEVR0RcW
         yUvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=V3/kmAeSuC3sr4iKKxqSQnU5UfmqOHV5XbVRzlbVZFI=;
        b=m4u0+fDqeSjy5NeJoafz38MvbdkJV+JPEHbk+95GDBVPthc9dPGlgty/U/gVHbzwtQ
         KEn20QuHx7/LrEWGH0z9y1NXy6mrx+Mu1gNFDnImFBIkxj/bgrKspb6NCyDDRvkbgVFA
         /iIdkEtBhUUKAznrVUJ0IuaX40JpIlNVLHNcCqowJwXImt+8JDiXmgYZcWvbzXVLF0tz
         HqrSJuIsy8MYeKjyw95PLAqe7LIeulxGKkUklNJkznQMwJ/cseZCt3v9X7kMnKJXWrHC
         r4ob1iZ+QBgcJUq4qF+1AGxqz8FF1t+tzUF1QxFxLMrlMUhNkm7I4s3+tc69dFDVMpyt
         T4nQ==
X-Gm-Message-State: APjAAAW29oBQSgc45SyWwVo9RTvtonY0/W9+hR8zWhy5g82x5ehSTo9n
        iZmiSH5J1fvys4+482mdfxK21g==
X-Google-Smtp-Source: APXvYqze6jA2/EZ5hFHAvx6eSRiUEQ9hQhLVH+5Tih9/Dt6jQ0LxF9rMGHt4XeLB/5F4K+0Syrl9Ow==
X-Received: by 2002:a17:902:264:: with SMTP id 91mr4608821plc.271.1579888830159;
        Fri, 24 Jan 2020 10:00:30 -0800 (PST)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id 2sm7216682pgo.79.2020.01.24.10.00.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2020 10:00:29 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Taniya Das <tdas@codeaurora.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] clk: qcom: rpmh: Sort OF match table
Date:   Fri, 24 Jan 2020 09:59:34 -0800
Message-Id: <20200124175934.3937473-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

sc7180 was added to the end of the match table, sort the table.

Fixes: eee28109f871 ("clk: qcom: clk-rpmh: Add support for RPMHCC for SC7180")
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/clk/qcom/clk-rpmh.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index 593bfa455768..98a118c1e244 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -487,9 +487,9 @@ static int clk_rpmh_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id clk_rpmh_match_table[] = {
+	{ .compatible = "qcom,sc7180-rpmh-clk", .data = &clk_rpmh_sc7180},
 	{ .compatible = "qcom,sdm845-rpmh-clk", .data = &clk_rpmh_sdm845},
 	{ .compatible = "qcom,sm8150-rpmh-clk", .data = &clk_rpmh_sm8150},
-	{ .compatible = "qcom,sc7180-rpmh-clk", .data = &clk_rpmh_sc7180},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, clk_rpmh_match_table);
-- 
2.24.0

