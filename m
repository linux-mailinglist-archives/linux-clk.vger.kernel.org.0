Return-Path: <linux-clk+bounces-20972-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70568A9A1D1
	for <lists+linux-clk@lfdr.de>; Thu, 24 Apr 2025 08:25:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 11C3716518E
	for <lists+linux-clk@lfdr.de>; Thu, 24 Apr 2025 06:24:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FAD11F8908;
	Thu, 24 Apr 2025 06:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="Y6J612th"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A021F4CBD
	for <linux-clk@vger.kernel.org>; Thu, 24 Apr 2025 06:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745475740; cv=none; b=ql8Kt0EhimdLs0Ale60LYXZS/T1AcLVPJ/B2KlXXQrbG0V+jgROaKbg9Fvq9YCopN8Z01W5OSEO0Dsv9OwmThY9z0POXabLDO2n9XD6JmnsBWOMPqt3rJpOv7NACLN4cFZAwMReDvQmJaQq3lrmCcRDW7kU6DltQCfriYPuZegk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745475740; c=relaxed/simple;
	bh=2cbL/UoMZsHKenEkqVA3bsu+mxjHyTBuUjF0+bypM38=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ngTALnwSnEjhdCwguvRSX8hDIe3rm9wQBulNtyIe4btY3w4fmmwg6MrHDhmIxJBQPvQlj/EMh2H/232P22Q7PchiaoMt9LMl98ZAN3MAc7gRO1CwrdD8zedbXr/BVjEQkPHXKcm+FgZAoeHDhYPRqGLldFz/c4UC+4H1zKb/m6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=Y6J612th; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so5573065e9.2
        for <linux-clk@vger.kernel.org>; Wed, 23 Apr 2025 23:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1745475737; x=1746080537; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gDZuiTdlw8039p8GoLYv+uw7eDAfVUu6FSj2o7a4bY0=;
        b=Y6J612thN/OWi8mgOKBuN0ry1NLUkZ0/SFecLpAW92NyAtNUYgFnHzZ+j1LOPU7ozK
         ysBbv7QzYNXJ3HiGrEktOPwA9yc52iJsRObM68q3oYkfkZcLKJ12yTqSXa1xlaxwN9Rp
         B/k2Nc0XtHDDTMHrx4cZ+m1o4a37EsOMXWfVo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745475737; x=1746080537;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gDZuiTdlw8039p8GoLYv+uw7eDAfVUu6FSj2o7a4bY0=;
        b=CHgcAGQkBEOO1uSH9KTNOGxgQTYO9bm6Qm3IPnhZC6NHfe4Z5Icmam3iQzVGxS68DK
         eRY0o2NuaZT1WryuQvFulUVlrTVBfHK4YLW9d/Rj7NNktcOYAFzt9Y1Crpnfo6obNFxP
         LFkd8yJUTdUZwBZC4Xcwyp0349gwef2hgIY8EKVF2kecfFZnae+VjY2+bxtPhPK80hbA
         NGHbFBQ0/6FZ3Njuw8ZqfMEjG/xT/s7oKr2q/6KY+aV/uXYVSTkyFcQ/ZbaU6CTPZQZ7
         j54ETr+bNWrxv8fUMLEtL3TYOyqiOC/5lr/wDRhTklpXYlfPvpMeO3MBEkAPPwCTI74u
         da7A==
X-Forwarded-Encrypted: i=1; AJvYcCWdS4q7KcnArtF69HAeWaYG+R0GZfDtqVd9UXXF4JRF1I47EtMj2YuAxKmwX3qPyJZ8Bvogw86tMc4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzeoEPqQOV8TocVcZpNxf5fcU9HEgUSxyNkQ7qRysaijTwHkxz5
	B6iPpDMkZ8RTra9Loi55pZTuTTHKP/YQ3r3/VREp2HSrirD+i/sg6lIUcwsIy48=
X-Gm-Gg: ASbGncsV9tAYVLxGzjdcMQSJQzduTqfKXuYn9eATR0/4JDCaKhesAdFFsAWMv15gdcj
	WSJ3qSO5bNaMpGzm/tkA/6T+1jmRr58vgpqAX3vZVB1/21OI4LbvqS+zWVuKn2sbFZKr1k0tKAj
	P0UeV2fX22PhvDwAwPh8CDuv4ofqAeJ8A+JFZMCtYZfwT6zMbCMY86Qiye9NzuLvUMOdTNOlwAP
	jWbSwHAqT9iD8586ZMSnRuJk4D5s1u646Ca67UkzJ5AL/lWspGAWqQc4twW4NQnrbH/e7NljbTi
	GV9A2aEoh+V2W1npkV1mkv7HzA0tREzqO7OKwiaaF8qDfS3W+ZHdMkTPZ4j74D1SPDZ2ql2HTNI
	QpbPC
X-Google-Smtp-Source: AGHT+IGyI/+7MJ4IDLyNiZ7HG0se9/Du4KUg/pG6scYz/TegXiOuG86VE+RGX6eH8s+Yzc+aY9yVDg==
X-Received: by 2002:a05:600c:4693:b0:43c:fa0e:471a with SMTP id 5b1f17b1804b1-4409bcfc14cmr9455825e9.5.1745475736712;
        Wed, 23 Apr 2025 23:22:16 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.65])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2bf8dbsm7243435e9.35.2025.04.23.23.22.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 23:22:16 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Peng Fan <peng.fan@nxp.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	linux-amarula@amarulasolutions.com,
	Abel Vesa <abelvesa@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Fabio Estevam <festevam@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v12 10/19] clk: imx: add hw API imx_anatop_get_clk_hw
Date: Thu, 24 Apr 2025 08:21:40 +0200
Message-ID: <20250424062154.2999219-11-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250424062154.2999219-1-dario.binacchi@amarulasolutions.com>
References: <20250424062154.2999219-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Get the hw of a clock registered by the anatop module. This function is
preparatory for future developments.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Reviewed-by: Peng Fan <peng.fan@nxp.com>

---

(no changes since v9)

Changes in v9:
- Add 'Reviewed-by' tag of Peng Fan

Changes in v7:
- Add device_node type parameter to imx8m_anatop_get_clk_hw()
- Rename imx8m_anatop_get_clk_hw() to imx_anatop_get_clk_hw()
- Drop the gaurding macros so the code can be used also by i.MX9

Changes in v5:
- Consider CONFIG_CLK_IMX8M{M,N,P,Q}_MODULE to fix compilation errors

Changes in v4:
- New

 drivers/clk/imx/clk.c | 15 +++++++++++++++
 drivers/clk/imx/clk.h |  2 ++
 2 files changed, 17 insertions(+)

diff --git a/drivers/clk/imx/clk.c b/drivers/clk/imx/clk.c
index df83bd939492..a906d3cd960b 100644
--- a/drivers/clk/imx/clk.c
+++ b/drivers/clk/imx/clk.c
@@ -128,6 +128,21 @@ struct clk_hw *imx_get_clk_hw_by_name(struct device_node *np, const char *name)
 }
 EXPORT_SYMBOL_GPL(imx_get_clk_hw_by_name);
 
+struct clk_hw *imx_anatop_get_clk_hw(struct device_node *np, int id)
+{
+	struct of_phandle_args args;
+	struct clk_hw *hw;
+
+	args.np = np;
+	args.args_count = 1;
+	args.args[0] = id;
+
+	hw = __clk_get_hw(of_clk_get_from_provider(&args));
+	pr_debug("%s: got clk: %s\n", __func__, clk_hw_get_name(hw));
+	return hw;
+}
+EXPORT_SYMBOL_GPL(imx_anatop_get_clk_hw);
+
 /*
  * This fixups the register CCM_CSCMR1 write value.
  * The write/read/divider values of the aclk_podf field
diff --git a/drivers/clk/imx/clk.h b/drivers/clk/imx/clk.h
index aa5202f284f3..50e407cf48d9 100644
--- a/drivers/clk/imx/clk.h
+++ b/drivers/clk/imx/clk.h
@@ -487,4 +487,6 @@ struct clk_hw *imx_clk_gpr_mux(const char *name, const char *compatible,
 			       u32 reg, const char **parent_names,
 			       u8 num_parents, const u32 *mux_table, u32 mask);
 
+struct clk_hw *imx_anatop_get_clk_hw(struct device_node *np, int id);
+
 #endif
-- 
2.43.0


