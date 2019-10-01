Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EF76DC3FCC
	for <lists+linux-clk@lfdr.de>; Tue,  1 Oct 2019 20:26:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732399AbfJASZv (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 1 Oct 2019 14:25:51 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:33962 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732271AbfJASZv (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 1 Oct 2019 14:25:51 -0400
Received: by mail-pl1-f195.google.com with SMTP id k7so5906433pll.1
        for <linux-clk@vger.kernel.org>; Tue, 01 Oct 2019 11:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=LzScokAJUZmfEzLyRgkBYA98Mp75br3n/i2JbQ8ioSU=;
        b=Eel1qi18Au+svdpZ7+XVj5a8bXyXORVjJPkq8MNCvHpEEiT0X2QJpv0kweG5dD01GT
         8jF1xfb3pML4lkci+3Mcza2vkDMURS9/pP2cU58heb6uUg/4zu/y8GXSNmzMXfFdp8f4
         oxBUb9ko7sRM7Sla0Mom37zphpvPzi7WrsMN68t3kNuqSBtu6BhkR1Kyzib3fILZYHAm
         I6BZSGvfJ6gJj8MER91eVYp2ty+rsdUeqYv1LEoiuoQl71QzvREzakFiQr1mwgVc2fyL
         9oYQ8mc6zZ6+SvhjeVy/wzaC7MRqeT4RvsidhvkAMDET1tVK6Y0ExYfznNAMET8JrzSD
         wbIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=LzScokAJUZmfEzLyRgkBYA98Mp75br3n/i2JbQ8ioSU=;
        b=ZGvBrkOxI6qk+FmHH+Uj5zittTuFKAAua4l3h/tCqqHmDOwSc8qY1YmQ8QnYydgD6p
         KQnDTSPGhhUTnBSEwl7e7H+qrakQ4WTfZ3Kwnp708qJTIhFlA8bKy1Lj0F5CpHRahJZI
         pYGbyp214xfZ8MHWF/9Ld6vlTD01H0In3teLpgyS5N7yqBdzIkewbZueBZsiOZVM5Nfb
         t5q5b4VQ5GErGrps4+6Da2BXsVwnNwYdYSDhELAF2g5VGKsccbpIhm8o54NpWhKmugHz
         REBwjG+OpvvY6EA0EPgYLe8OmkfWs0p7YWgckK3p/sn4DeBgPL+ovGeh6geOd8EJzYfe
         sCEQ==
X-Gm-Message-State: APjAAAVS0+y0HH8Z3gqE3LzGFOLmAS5cO+SJj8lllrjJ6Aed3AEcWaRb
        OcGnLrRb3iZ7tY2IEIzBPByRmQ==
X-Google-Smtp-Source: APXvYqy/JN5Tukl6e1s+uskah3wczLS0qKNm1HHwfv24GZ0gm9S3ONW3SZg0fKBQSIEgdXHSBoByrA==
X-Received: by 2002:a17:902:fe86:: with SMTP id x6mr27652483plm.28.1569954350285;
        Tue, 01 Oct 2019 11:25:50 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id e14sm3095996pjt.8.2019.10.01.11.25.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2019 11:25:49 -0700 (PDT)
From:   John Stultz <john.stultz@linaro.org>
To:     lkml <linux-kernel@vger.kernel.org>
Cc:     Peter Griffin <peter.griffin@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Allison Randal <allison@lohutok.net>,
        linux-clk@vger.kernel.org, John Stultz <john.stultz@linaro.org>
Subject: [PATCH] clk: hi6220: use CLK_OF_DECLARE_DRIVER
Date:   Tue,  1 Oct 2019 18:25:46 +0000
Message-Id: <20191001182546.70090-1-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Peter Griffin <peter.griffin@linaro.org>

As now we also need to probe in the reset driver as well.

Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Allison Randal <allison@lohutok.net>
Cc: Peter Griffin <peter.griffin@linaro.org>
Cc: linux-clk@vger.kernel.org
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
 drivers/clk/hisilicon/clk-hi6220.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/hisilicon/clk-hi6220.c b/drivers/clk/hisilicon/clk-hi6220.c
index b2c5b6bbb1c1..63a94e1b6785 100644
--- a/drivers/clk/hisilicon/clk-hi6220.c
+++ b/drivers/clk/hisilicon/clk-hi6220.c
@@ -86,7 +86,7 @@ static void __init hi6220_clk_ao_init(struct device_node *np)
 	hisi_clk_register_gate_sep(hi6220_separated_gate_clks_ao,
 				ARRAY_SIZE(hi6220_separated_gate_clks_ao), clk_data_ao);
 }
-CLK_OF_DECLARE(hi6220_clk_ao, "hisilicon,hi6220-aoctrl", hi6220_clk_ao_init);
+CLK_OF_DECLARE_DRIVER(hi6220_clk_ao, "hisilicon,hi6220-aoctrl", hi6220_clk_ao_init);
 
 
 /* clocks in sysctrl */
-- 
2.17.1

