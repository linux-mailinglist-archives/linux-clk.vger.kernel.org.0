Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 53D541BE5D
	for <lists+linux-clk@lfdr.de>; Mon, 13 May 2019 22:08:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726109AbfEMUIK (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 13 May 2019 16:08:10 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:42614 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726084AbfEMUIJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 13 May 2019 16:08:09 -0400
Received: by mail-io1-f67.google.com with SMTP id g16so11107758iom.9
        for <linux-clk@vger.kernel.org>; Mon, 13 May 2019 13:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tVpxrVqtZ6so56rmoXRO/UqKolhNWwjERgPc3LzGFN8=;
        b=hSXxafaV5iTjOToTOFm4RvKmXIJLq851eKZ0B8cA9rjCzP2lEK7Ikybh/EnCwRncxd
         y4SFaafG08JvytYn5XC+jiHhPG2URqrcilytocl+eOTZmHcYxn9/IEgq25FW5lz79n2q
         4qVl9TtNf80RAVLRrsPKKLHLkPn9xNZbZcwAFgA5GEHrCVMJyk3INBoBbmfModA0ugMO
         9HM1hRCR5mxxaKFmCVTokyVPhdzIJq1ZrhfwoCNM9EKO/hi5s5aICg+1FEvj8l6JXuun
         NpvSgJdDZovD7yJfYykntLRjnfcJjEIvFXOwfDFbTQKdEFxz7RRnvi3+FTWXNPBIpVsa
         1sBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tVpxrVqtZ6so56rmoXRO/UqKolhNWwjERgPc3LzGFN8=;
        b=LMXk5kvZYq/HyJ9LFAZAhbDw3D9gKyjiahuxYewXcTiW+zn+SM8RUkIk17bh1Ng0bm
         UpUVI9piDuTs8ZjSvkjPKf0pDX5ln6HhUUXsvMw9uMMAJPYskKglqW0GkpBLtbHic/+H
         wN/M7V1oWnLWQOyLZivKIFYY3l+sJcZkLkI0OFJ47E86NeCVo3e417bm/QByCiz+edsO
         9jF6xctzCupjA74M2K9Fy7nfdKpLJ0c45kxr7hMRz7XCBhCWrHjdSvyFvv5HAlRTNpy+
         IyqsaYwgLRNcgT58dCBuNTN0/h177A0fz2MhX7ccKyQe77+5cu1BXBYee2gyI4WU/ION
         B0Og==
X-Gm-Message-State: APjAAAVFl2M0MXZf2lC8ldnYzIdFpMglR0/ejMNfz7ZBsvJsGDn/s6rk
        p83xSXRvWZXeKR8HcTevHT6agQ==
X-Google-Smtp-Source: APXvYqyw8zFE1ynOjqj9m0tDEwjIwV/Nsk7yMgV7lkFPmgfuZg00tc/M+Qp16udiiomTmHQFlr0Prw==
X-Received: by 2002:a5d:9e01:: with SMTP id h1mr2997330ioh.57.1557778088886;
        Mon, 13 May 2019 13:08:08 -0700 (PDT)
Received: from viisi.lan (c-73-95-159-87.hsd1.co.comcast.net. [73.95.159.87])
        by smtp.gmail.com with ESMTPSA id h21sm242468ith.8.2019.05.13.13.08.07
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 May 2019 13:08:08 -0700 (PDT)
From:   Paul Walmsley <paul.walmsley@sifive.com>
To:     sboyd@kernel.org, mturquette@baylibre.com, pavel@ucw.cz
Cc:     linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-clk@vger.kernel.org,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Paul Walmsley <paul@pwsan.com>
Subject: [PATCH] clk: sifive: restrict Kconfig scope for the FU540 PRCI driver
Date:   Mon, 13 May 2019 13:07:58 -0700
Message-Id: <20190513200758.15241-1-paul.walmsley@sifive.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Restrict Kconfig scope for SiFive clock and reset IP block drivers
such that they won't appear on most configurations that are unlikely
to support them.  This is based on a suggestion from Pavel Machek
<pavel@ucw.cz>.  Ideally this should be dependent on
CONFIG_ARCH_SIFIVE, but since that Kconfig directive does not yet
exist, add dependencies on RISCV or COMPILE_TEST for now.

Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
Signed-off-by: Paul Walmsley <paul@pwsan.com>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Pavel Machek <pavel@ucw.cz>
---
 drivers/clk/sifive/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/sifive/Kconfig b/drivers/clk/sifive/Kconfig
index 8db4a3eb4782..27a8fe531357 100644
--- a/drivers/clk/sifive/Kconfig
+++ b/drivers/clk/sifive/Kconfig
@@ -2,6 +2,7 @@
 
 menuconfig CLK_SIFIVE
 	bool "SiFive SoC driver support"
+	depends on RISCV || COMPILE_TEST
 	help
 	  SoC drivers for SiFive Linux-capable SoCs.
 
@@ -10,6 +11,7 @@ if CLK_SIFIVE
 config CLK_SIFIVE_FU540_PRCI
 	bool "PRCI driver for SiFive FU540 SoCs"
 	select CLK_ANALOGBITS_WRPLL_CLN28HPC
+	depends on RISCV || COMPILE_TEST
 	help
 	  Supports the Power Reset Clock interface (PRCI) IP block found in
 	  FU540 SoCs.  If this kernel is meant to run on a SiFive FU540 SoC,
-- 
2.20.1

