Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A1B3B9D443
	for <lists+linux-clk@lfdr.de>; Mon, 26 Aug 2019 18:45:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732996AbfHZQpU (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 26 Aug 2019 12:45:20 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:35391 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732983AbfHZQpU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 26 Aug 2019 12:45:20 -0400
Received: by mail-wr1-f68.google.com with SMTP id k2so16001048wrq.2
        for <linux-clk@vger.kernel.org>; Mon, 26 Aug 2019 09:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AduWeROQMDkKls+kl/fLswGL+rHZfEiqcyM0mR/LCMQ=;
        b=ZIQIzeKYCgaQGA3mvoHdMljzb0wEi7oer9LTbZr5HMpxDFPOgxtKb6VqdW862YV8km
         04stCMBB1CU0drEjv/HuwbCLA/Jd1m4jBj2IX5eP5GcLNb5H0y96of/8RLrgkCVmJDiA
         t6avVK9FSWPEWWBcj4zHGwA+FTc9+7NYbGw2PSPIWtdzIIsiVV33OHd06oRpaEnDWfjN
         kAPZ/UIGq3FLf5aMXUUhbColc9tbabiobhcFIRuv2HQxs7FFIh+m2bjFJ1v2eRfkr8lt
         L8NkMZsn9ZC+KG+n8ZrT/975M13k6QJZKo3CsK2SJT13L/Z7K/MRW8HEtqxwztb/2Xk0
         6QVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AduWeROQMDkKls+kl/fLswGL+rHZfEiqcyM0mR/LCMQ=;
        b=syR7NCtFZbEFIeOg1Zn2Ow+mc+DjDbK0wLyUkoIMkiIFVPv5VGsy/vBLWwOcqn2NSx
         gqJPiJyH8tjyLc4/yZ7+lLyqRrKTkafQiMUkRNiVeBnE7URDsy9ijJDXPhXwxtv8VZ9Q
         Bzltl4Mxnr15EXkv2g+FR2hrlOfkEWKitMBk01rIHDbzbpi3KnBXanjpLqC2wIgVlV/G
         PlgbppfIZ6qptav2p3UB/oIxdJ5eZUYK1Vu9HyrQyCUJSmfMNZnAGFJwpGx1uPB5kYGD
         s4S08tqmbNXiEekYeERVNzM+Ru5YPx3uS0zxCF5mz47raVPab6/K8Le+ELz5ZmzKEF1M
         L8Lg==
X-Gm-Message-State: APjAAAUvJhVc5ojGEHFvwF4vSbBXmIc4vQothtKewB4SIS6ZPOM0JGe1
        oMtW6dVdWPcxjfY/Hc/N9hZioA==
X-Google-Smtp-Source: APXvYqy0keQA67hzBHSf6JmnEJPjZvrevuThhyTnApH6TfZIBG2gotXVyRWSN+8mPw7MptkOjV1tqw==
X-Received: by 2002:a5d:610d:: with SMTP id v13mr24331376wrt.249.1566837918384;
        Mon, 26 Aug 2019 09:45:18 -0700 (PDT)
Received: from localhost.localdomain (124.red-83-36-179.dynamicip.rima-tde.net. [83.36.179.124])
        by smtp.gmail.com with ESMTPSA id l62sm77872wml.13.2019.08.26.09.45.17
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 26 Aug 2019 09:45:17 -0700 (PDT)
From:   Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
To:     jorge.ramirez-ortiz@linaro.org, sboyd@kernel.org,
        agross@kernel.org, mturquette@baylibre.com
Cc:     bjorn.andersson@linaro.org, niklas.cassel@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] clk: qcom: hfpll: CLK_IGNORE_UNUSED
Date:   Mon, 26 Aug 2019 18:45:10 +0200
Message-Id: <20190826164510.6425-5-jorge.ramirez-ortiz@linaro.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190826164510.6425-1-jorge.ramirez-ortiz@linaro.org>
References: <20190826164510.6425-1-jorge.ramirez-ortiz@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

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
 drivers/clk/qcom/hfpll.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/clk/qcom/hfpll.c b/drivers/clk/qcom/hfpll.c
index 0ffed0d41c50..d5fd27938e7b 100644
--- a/drivers/clk/qcom/hfpll.c
+++ b/drivers/clk/qcom/hfpll.c
@@ -58,6 +58,13 @@ static int qcom_hfpll_probe(struct platform_device *pdev)
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
 
 	h = devm_kzalloc(dev, sizeof(*h), GFP_KERNEL);
-- 
2.22.0

