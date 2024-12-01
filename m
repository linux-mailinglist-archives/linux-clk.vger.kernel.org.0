Return-Path: <linux-clk+bounces-15173-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A52FD9DF6C6
	for <lists+linux-clk@lfdr.de>; Sun,  1 Dec 2024 18:49:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1044CB22206
	for <lists+linux-clk@lfdr.de>; Sun,  1 Dec 2024 17:49:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06D451DDC32;
	Sun,  1 Dec 2024 17:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="B/ZBjiYT"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF3A1DDC06
	for <linux-clk@vger.kernel.org>; Sun,  1 Dec 2024 17:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733075260; cv=none; b=tqDtEC+0TEiUZu4VqT9d0V2RmucPfLGfiVBSJqV84NDmqw/0Anoad7v/PEPHq7wnLqC+Wg7LMIXG9SrCO0NxGOjT8VkhOW6Rm1li0u/pH2eTZYj60I4fON3xUqgh9Ap0OJHidGZ/NGfnYAE8lac13NaayqDvAXeHIpW4H7ji2OM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733075260; c=relaxed/simple;
	bh=yCf6o4aEUfslJcLLJEqow/qgmD3/3fEPCIzJe9arT9A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UehYoYxtPqdfW2RjNsBYVuyEc3ny6EHvU/crFTID4xngaoAhTr7UGGT60ZpzcEYRa4cnXk8LR1t47kJMoJRAqTF8Spcm3KJINnFKzAMSD/kC7yfmDPWFysWqapz+Gt8wh+OYEnNBQo6bscJpnZnn51jl9NGHTwKdvzOsX+CWItk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=B/ZBjiYT; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-aa532dcb470so241146066b.2
        for <linux-clk@vger.kernel.org>; Sun, 01 Dec 2024 09:47:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1733075258; x=1733680058; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eZ3YHSAuF6GRZeer7tzybOaIp6SswmD+4eSpj3aybE0=;
        b=B/ZBjiYT4sP2Dq/fYjDo6xdmyZJKzgEEhzrxAYSoGBEDZ6+EJsaHPcBw2TVDwdP8Ko
         3zTbq3pjThRPEh/7vD1l9NmZZQg6EljJdAN3DXUCnXvOrz1sAmUeOCmjD7anOvoBTRHY
         yZ34UexqOtxVQN8eM1I+pvRBDzDBxCXYnZszQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733075258; x=1733680058;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eZ3YHSAuF6GRZeer7tzybOaIp6SswmD+4eSpj3aybE0=;
        b=sQPXARts757QIsA5Y45uZnuL6HI8WLChLlKyxzS/Z0gchttNiUqnIGpqxcEES2wS/k
         u/UVoKhnHYjLZsb4s0rK646Bww4C3MoPdk0mhIHbnyZA9DxF/T8TIsSY9Ii5QSasy7wq
         uFRCR8pHZsZdEdy94Az43kHO8cEtExn/PPf4a1caOysnsHcCryNCfigUVDYcimkTGaFF
         5SC9QoATBhu5NcYG+uaaMlNjIqrH6JhFilQDPjPexKFz/bInGdPcVfhThBMC0GFvoCI9
         L9Lx1QYexSO0AQpWfyXL8QDOS9obHg79OKPMF3dWuuyMLcfLt+D60PBEOp/6cRG2ByOn
         VvoA==
X-Forwarded-Encrypted: i=1; AJvYcCVYiFaPXPq6P+zsz89vwEm59Hm5opM6YK/H4adf27zEf0crWDlv1eM2Vc4HXOANwMekYgpH82t83C4=@vger.kernel.org
X-Gm-Message-State: AOJu0YynbWm5U5VNnOSDy5c+WEelUNeDtt8yAqOGjkeFovGZP6ayhA3i
	kd5UqCuRr0P33clnexylIM8yBVYCi+l0KRTi2ZwR43E3P+rb2AZ/L/ZrqGElR0Q=
X-Gm-Gg: ASbGncvHwi/MnxETlpbuPaw3uo5xT8fmRZbRlY1dAVUtZGCWNpJDuQ+qzGzFBQL0XM6
	i6lAjajXZ50v/jAgEjVp4l1PA18eDuKEEa4Su1j90o2Sa21fffIZyRdIJFQlrACtAPbID89vesz
	PQ+DgUZd0FyHDXIBjO/HqGKRxZtI/lAHYNVse12XYRx2Bu62TE+5t58IpJTIDEks+pQgcd8gq+s
	FKArKCHt7uiM1NWwu/h6fkcccPDnFFNJElpkOrrnhGTUTcJda9VOs3ukSyaaVlDL0Zw0YIVaN7m
	OiXogRAm1t776/a/iqwTkD+Fww166xeQKpvPK/Yv1U8MZxMXdL7muLBAFtgC6onPCBe/8qsdDzV
	ZnHe6zG4oCs9wP2lk
X-Google-Smtp-Source: AGHT+IGzjP2fqXTt6+l7OVN5JKc8cizq18lY5oJ6KQTBWwgFH+n4/LFwzMSUmqzkFa0IBPwW9Wme7g==
X-Received: by 2002:a05:6402:270d:b0:5d0:d2ed:ebb with SMTP id 4fb4d7f45d1cf-5d0d2ed103fmr8950481a12.3.1733075257612;
        Sun, 01 Dec 2024 09:47:37 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-54-94-193.retail.telecomitalia.it. [82.54.94.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa59990a78esm415220066b.163.2024.12.01.09.47.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Dec 2024 09:47:36 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v4 11/18] clk: imx: add hw API imx8m_anatop_get_clk_hw
Date: Sun,  1 Dec 2024 18:46:11 +0100
Message-ID: <20241201174639.742000-12-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241201174639.742000-1-dario.binacchi@amarulasolutions.com>
References: <20241201174639.742000-1-dario.binacchi@amarulasolutions.com>
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

 - Added in v4

---

(no changes since v1)

 drivers/clk/imx/clk.c | 26 ++++++++++++++++++++++++++
 drivers/clk/imx/clk.h |  6 ++++++
 2 files changed, 32 insertions(+)

diff --git a/drivers/clk/imx/clk.c b/drivers/clk/imx/clk.c
index df83bd939492..8a8473a77b7c 100644
--- a/drivers/clk/imx/clk.c
+++ b/drivers/clk/imx/clk.c
@@ -128,6 +128,32 @@ struct clk_hw *imx_get_clk_hw_by_name(struct device_node *np, const char *name)
 }
 EXPORT_SYMBOL_GPL(imx_get_clk_hw_by_name);
 
+#if defined(CONFIG_CLK_IMX8MM) || defined(CONFIG_CLK_IMX8MN) || \
+	defined(CONFIG_CLK_IMX8MP) || defined(CONFIG_CLK_IMX8MQ)
+struct clk_hw *imx8m_anatop_get_clk_hw(int id)
+{
+#if defined(CONFIG_CLK_IMX8MQ)
+	const char *compatible = "fsl,imx8mq-anatop";
+#else
+	const char *compatible = "fsl,imx8mm-anatop";
+#endif
+	struct device_node *np;
+	struct of_phandle_args args;
+	struct clk_hw *hw;
+
+	np = of_find_compatible_node(NULL, NULL, compatible);
+	args.np = np;
+	args.args_count = 1;
+	args.args[0] = id;
+	of_node_put(np);
+
+	hw = __clk_get_hw(of_clk_get_from_provider(&args));
+	pr_debug("%s: got clk: %s\n", __func__, clk_hw_get_name(hw));
+	return hw;
+}
+EXPORT_SYMBOL_GPL(imx8m_anatop_get_clk_hw);
+#endif
+
 /*
  * This fixups the register CCM_CSCMR1 write value.
  * The write/read/divider values of the aclk_podf field
diff --git a/drivers/clk/imx/clk.h b/drivers/clk/imx/clk.h
index aa5202f284f3..6b6af26f4f1e 100644
--- a/drivers/clk/imx/clk.h
+++ b/drivers/clk/imx/clk.h
@@ -487,4 +487,10 @@ struct clk_hw *imx_clk_gpr_mux(const char *name, const char *compatible,
 			       u32 reg, const char **parent_names,
 			       u8 num_parents, const u32 *mux_table, u32 mask);
 
+
+#if defined(CONFIG_CLK_IMX8MM) || defined(CONFIG_CLK_IMX8MN) || \
+	defined(CONFIG_CLK_IMX8MP) || defined(CONFIG_CLK_IMX8MQ)
+struct clk_hw *imx8m_anatop_get_clk_hw(int id);
+#endif
+
 #endif
-- 
2.43.0


