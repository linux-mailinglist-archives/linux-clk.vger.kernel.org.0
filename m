Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A3C178C89
	for <lists+linux-clk@lfdr.de>; Mon, 29 Jul 2019 15:17:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728568AbfG2NRC (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 29 Jul 2019 09:17:02 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:55790 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728052AbfG2NRC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 29 Jul 2019 09:17:02 -0400
Received: by mail-wm1-f68.google.com with SMTP id a15so53823953wmj.5
        for <linux-clk@vger.kernel.org>; Mon, 29 Jul 2019 06:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sLpjjKS1ce8bNQv8q/Qa2SJ22ctxx4jp20Vf7E5q7wU=;
        b=CLMiw/2aayuVDYeC8v+Hbs9eP9dRkSbExFD5+zaZD8XVZntLt21BOp69K1tnRRpjbW
         h1x6kbaocxmTZlgdkOUZgm3WJWxq1hMdlN8cTBLsyjebws2ydUOJ6ty5W1EE1SsdSXLC
         XDvlDjLNYQsTpJELOf5Goop1SSsDjIerBO2nq949ozhky/+DVkMb6ZCcqiAxOA+ulJ/m
         ddqoDYpU4+h9G1Jt9DOM6Ni4fwIoDJbAvBQyFiY5fLci9NEtaNz/LfRCK+zi4cjHTz/n
         tl2sSIZsHc1nOwvWY7yhIHw0wek4Pbo7+DYcXof7ZE7saR6s4hFgKhah7o+7+Bo1SpgV
         0W4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sLpjjKS1ce8bNQv8q/Qa2SJ22ctxx4jp20Vf7E5q7wU=;
        b=glHFHFgdfcJ2Gfxti6g58QRV+OiV9oLOq7vFtMELNzrUbY33KW60ZKemFpP5WdMgZZ
         beFi+xNJ9uNgeai3h1mS3G/j+c3le5DjBit1269ck8BpGML6OleN/Ktwe8bAmTP6j6Yi
         EtV6xSbe+VUQTEwUAsYDr6j+QVLwS4c/1QMR+mIBhyYnSvbszUDQX63mf6kwgmui7Vxw
         iXjcQEa0qj9iPizv70V2C6NeLD7r0es7HBjzhGwgh3gWhLFR0Kw5pG3+Xu154onlYQK4
         D16jfwAgrE/HiPApWQ7RxyED6q0G7BQMrkM3BXFj83dIGdg8RQeW9SdLc4PW1KTn6WOb
         jhZw==
X-Gm-Message-State: APjAAAVdDb/Z1k4zgGcSi+vn/oeJMcfNr1TndRLp3sfKtupCbfanYI01
        ygSfqMzmmObGV5yNmgfan4VwuA==
X-Google-Smtp-Source: APXvYqx9NaFkCsFk23eBGAF2Pv6Iu97a1Kl1E5TPuDeCk21lE8wkpH5qEfKm7if84d09Xzyl2Cz8fQ==
X-Received: by 2002:a1c:f418:: with SMTP id z24mr50475428wma.80.1564406220079;
        Mon, 29 Jul 2019 06:17:00 -0700 (PDT)
Received: from bender.baylibre.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id b5sm52520490wru.69.2019.07.29.06.16.59
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 29 Jul 2019 06:16:59 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     sboyd@kernel.org, jbrunet@baylibre.com
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 1/4] clk: core: introduce clk_hw_set_parent()
Date:   Mon, 29 Jul 2019 15:16:53 +0200
Message-Id: <20190729131656.7308-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190729131656.7308-1-narmstrong@baylibre.com>
References: <20190729131656.7308-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Introduce the clk_hw_set_parent() provider call to change parent of
a clock by using the clk_hw pointers.

This eases the clock reparenting from clock rate notifiers and
implementing DVFS with simpler code avoiding the boilerplates
functions as __clk_lookup(clk_hw_get_name()) then clk_set_parent().

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/clk/clk.c            | 6 ++++++
 include/linux/clk-provider.h | 1 +
 2 files changed, 7 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index c0990703ce54..c11b1781d24a 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2487,6 +2487,12 @@ static int clk_core_set_parent_nolock(struct clk_core *core,
 	return ret;
 }
 
+int clk_hw_set_parent(struct clk_hw *hw, struct clk_hw *parent)
+{
+	return clk_core_set_parent_nolock(hw->core, parent->core);
+}
+EXPORT_SYMBOL_GPL(clk_hw_set_parent);
+
 /**
  * clk_set_parent - switch the parent of a mux clk
  * @clk: the mux clk whose input we are switching
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 2ae7604783dd..dce5521a9bf6 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -817,6 +817,7 @@ unsigned int clk_hw_get_num_parents(const struct clk_hw *hw);
 struct clk_hw *clk_hw_get_parent(const struct clk_hw *hw);
 struct clk_hw *clk_hw_get_parent_by_index(const struct clk_hw *hw,
 					  unsigned int index);
+int clk_hw_set_parent(struct clk_hw *hw, struct clk_hw *new_parent);
 unsigned int __clk_get_enable_count(struct clk *clk);
 unsigned long clk_hw_get_rate(const struct clk_hw *hw);
 unsigned long __clk_get_flags(struct clk *clk);
-- 
2.22.0

