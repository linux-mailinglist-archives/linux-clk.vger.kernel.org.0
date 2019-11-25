Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9FD78108F6A
	for <lists+linux-clk@lfdr.de>; Mon, 25 Nov 2019 14:59:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727928AbfKYN7h (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 25 Nov 2019 08:59:37 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:37910 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727919AbfKYN7h (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 25 Nov 2019 08:59:37 -0500
Received: by mail-lj1-f194.google.com with SMTP id k8so5441655ljh.5
        for <linux-clk@vger.kernel.org>; Mon, 25 Nov 2019 05:59:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WZkXKWPlxV38+RGHoXYmkSG5VWJOb6ms6DI9j57Q8ak=;
        b=VVW80aUaA6CDpUPPAiJcUsgChOZb4zTH0QwFYFtR7JP+HUKkuPJ+i9XWLXyhyQVr50
         AWdwJCtNYXP26uSH5xqPCKA769xOd4tpgEP7RC+Y+aDCtOALI8Gy5Ert/WtaDJkTBXmE
         ezomzfwvrwM6f761uHxxpEbTxUVd3gNfpLKN6N62wxJrPGGSwne7XIZTga8QNCHC/tQc
         9h0HyfzZimccS4kViSljdHy/VnqV6TvXAkwYbDDD7U9GqOZ8IRxnVLx1Ku//fVs1tbRR
         M+8UCF0XyoGB1sYLNH18gnEXmgTTwYQ0nySr2W0IHkcRyrh2+NsailaBHpPcCEkfAQZq
         M7hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WZkXKWPlxV38+RGHoXYmkSG5VWJOb6ms6DI9j57Q8ak=;
        b=nz3slYYcKLCCdUFGORIze/hQyFeZPNWQSmxC7MIXB9EtKcZJ09XVyyOWdQQhxTKyzn
         AvFQnSnUaaaUwnLrTSd7Sjb9fcX0YEKHbA/SARcwxAp+k9ldwPpxrOXjGA1ds1XlSY2t
         n0vQAPiQSjA6i+yyGOBiPEOp8IeB1EEPhSz/x1eiKWLMtIB8Y+mOMNllHmDkuEOuAY8w
         jOHI6hNYZyYiHlkd7uy7XG01Ufa9RrtslIkLcJIFRVHVpGWhyJQBX4V7K2IProBPK+C1
         +ePwIsBQba0+7T8XPY1SFOhtixMgYz/nBxJVPPK4J/IcenXSKHi02Pe1iwcI1aWkAQ6J
         mrpQ==
X-Gm-Message-State: APjAAAWzg8/OUKG3HCVezlvC8MiF9TQowo9cCYN4pDxBM1NI4Ef6e60j
        T30x4jQO0VM11DaclxFm61jiDA==
X-Google-Smtp-Source: APXvYqxkxEhav7mp9DLDaxmIBhKxHjUP1VcY5YxsCU1X4UHEjN5JNTkSMeSSsHkrhXb9xrhsWEXBVg==
X-Received: by 2002:a2e:844e:: with SMTP id u14mr9142325ljh.17.1574690373313;
        Mon, 25 Nov 2019 05:59:33 -0800 (PST)
Received: from centauri.lan (ua-84-217-220-205.bbcust.telenor.se. [84.217.220.205])
        by smtp.gmail.com with ESMTPSA id s23sm4041871ljm.20.2019.11.25.05.59.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2019 05:59:32 -0800 (PST)
From:   Niklas Cassel <niklas.cassel@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, amit.kucheria@linaro.org,
        sboyd@kernel.org,
        Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
        Niklas Cassel <niklas.cassel@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/7] clk: qcom: hfpll: CLK_IGNORE_UNUSED
Date:   Mon, 25 Nov 2019 14:59:06 +0100
Message-Id: <20191125135910.679310-5-niklas.cassel@linaro.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191125135910.679310-1-niklas.cassel@linaro.org>
References: <20191125135910.679310-1-niklas.cassel@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>

When COMMON_CLK_DISABLED_UNUSED is set, in an effort to save power and
to keep the software model of the clock in line with reality, the
framework transverses the clock tree and disables those clocks that
were enabled by the firmware but have not been enabled by any device
driver.

If CPUFREQ is enabled, early during the system boot, it might attempt
to change the CPU frequency ("set_rate"). If the HFPLL is selected as
a provider, it will then change the rate for this clock.

As boot continues, clk_disable_unused_subtree will run. Since it wont
find a valid counter (enable_count) for a clock that is actually
enabled it will attempt to disable it which will cause the CPU to
stop. Notice that in this driver, calls to check whether the clock is
enabled are routed via the is_enabled callback which queries the
hardware.

The following commit, rather than marking the clock critical and
forcing the clock to be always enabled, addresses the above scenario
making sure the clock is not disabled but it continues to rely on the
firmware to enable the clock.

Co-developed-by: Niklas Cassel <niklas.cassel@linaro.org>
Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
Changes since v2:
-None

 drivers/clk/qcom/hfpll.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/clk/qcom/hfpll.c b/drivers/clk/qcom/hfpll.c
index e64c0fd82fe4..225c675f6779 100644
--- a/drivers/clk/qcom/hfpll.c
+++ b/drivers/clk/qcom/hfpll.c
@@ -56,6 +56,13 @@ static int qcom_hfpll_probe(struct platform_device *pdev)
 		.parent_names = (const char *[]){ "xo" },
 		.num_parents = 1,
 		.ops = &clk_ops_hfpll,
+		/*
+		 * rather than marking the clock critical and forcing the clock
+		 * to be always enabled, we make sure that the clock is not
+		 * disabled: the firmware remains responsible of enabling this
+		 * clock (for more info check the commit log)
+		 */
+		.flags = CLK_IGNORE_UNUSED,
 	};
 	int ret;
 
-- 
2.23.0

