Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC5F64D119
	for <lists+linux-clk@lfdr.de>; Thu, 20 Jun 2019 17:00:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731805AbfFTPAZ (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 20 Jun 2019 11:00:25 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:51434 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726654AbfFTPAY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 20 Jun 2019 11:00:24 -0400
Received: by mail-wm1-f68.google.com with SMTP id 207so3418317wma.1
        for <linux-clk@vger.kernel.org>; Thu, 20 Jun 2019 08:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=By2vibD8ed5SvKJiLslQhTFpnxDveNnIcoeXnTW3Wf0=;
        b=aQf+Iy0nQ0FQz8qVhHiGfNhuG8rZz4Xwl8uToXWSA9d/lK5cjgTn5CJbCx89xFVaUY
         zhvkAyBr0XVnDpxdj7Os7AjgRlMh3uMWCzy7V7QqvOBDr9m3wKmhkzqxgw02c/jmoZDd
         pkYbaHjQAE+XlY0OUqp+Tm3cMJVRI8gogX6H21TYpYDn6V0yTXXjkgr6zLhR1ccb/Qur
         Sy0w50kZ1kuE5m2WZZog4dyJjKa5qzizHbfwjscF+BBrU/SGTkIKzLvD9lbMoJIKyhFF
         vpshSB7255OsuDSy8vFEEwplNxQtoiCs3MhaVO1BfwvwWxNTNrQGApMOsLU8dmjwWgSg
         zkrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=By2vibD8ed5SvKJiLslQhTFpnxDveNnIcoeXnTW3Wf0=;
        b=FV3M1/4iH+8zHWEpbpKEM8jptxvDaL9vuaZgCp2X8zy5rFIAqna/kpgIUfYkm5ZRx2
         WDchA+7jYau+0zSFX+EP+Mwptq+UwHa8RvrHnJJ2RFzXYJ57s/KIvrlWfBHlbZxMMVVN
         EPiR+Af8l50YOMLHxWLh1dtY1o4oeIU8aD89anwQk1LjaiswaXP27YTYLsML8P96+8bv
         l5jg9KbKdr8yAqnkEcYwX+2emsdTLPqvkNcvGVpTMl0Z3djdCljjgJ5m9xNZTunG09KL
         g7t9w2DKf1f8GeiNE6LjqQeHFif6ESXNp0+l68gwGsZANiPxK+5gTtwzp139etHD2apV
         wcSA==
X-Gm-Message-State: APjAAAU+IBTZIhP+oEDOfJAtfBO6O8Ztl7PI58XIYOScsYAMjyieT6dj
        ItNaHxSK6agavhyB12Tr0ZG9SA==
X-Google-Smtp-Source: APXvYqy4PpfMpc89fPxuLdkIg+PgewzWYS4fDQc+uPktXcbMW544oq2gwfbsa8I3ngP0nFcrvQzD3A==
X-Received: by 2002:a1c:f205:: with SMTP id s5mr81645wmc.14.1561042822413;
        Thu, 20 Jun 2019 08:00:22 -0700 (PDT)
Received: from bender.baylibre.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id o126sm6802520wmo.1.2019.06.20.08.00.21
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 20 Jun 2019 08:00:21 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     jbrunet@baylibre.com, khilman@baylibre.com
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, martin.blumenstingl@googlemail.com,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: [RFC/RFT 02/14] clk: core: introduce clk_hw_set_parent()
Date:   Thu, 20 Jun 2019 17:00:01 +0200
Message-Id: <20190620150013.13462-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190620150013.13462-1-narmstrong@baylibre.com>
References: <20190620150013.13462-1-narmstrong@baylibre.com>
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
---
 drivers/clk/clk.c            | 5 +++++
 include/linux/clk-provider.h | 1 +
 2 files changed, 6 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index aa51756fd4d6..3e98f7dec626 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2490,6 +2490,11 @@ static int clk_core_set_parent_nolock(struct clk_core *core,
 	return ret;
 }
 
+int clk_hw_set_parent(struct clk_hw *hw, struct clk_hw *parent)
+{
+	return clk_core_set_parent_nolock(hw->core, parent->core);
+}
+
 /**
  * clk_set_parent - switch the parent of a mux clk
  * @clk: the mux clk whose input we are switching
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index bb6118f79784..8a453380f9a4 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -812,6 +812,7 @@ unsigned int clk_hw_get_num_parents(const struct clk_hw *hw);
 struct clk_hw *clk_hw_get_parent(const struct clk_hw *hw);
 struct clk_hw *clk_hw_get_parent_by_index(const struct clk_hw *hw,
 					  unsigned int index);
+int clk_hw_set_parent(struct clk_hw *hw, struct clk_hw *new_parent);
 unsigned int __clk_get_enable_count(struct clk *clk);
 unsigned long clk_hw_get_rate(const struct clk_hw *hw);
 unsigned long __clk_get_flags(struct clk *clk);
-- 
2.21.0

