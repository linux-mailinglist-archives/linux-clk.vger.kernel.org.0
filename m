Return-Path: <linux-clk+bounces-553-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67FDC7F7781
	for <lists+linux-clk@lfdr.de>; Fri, 24 Nov 2023 16:19:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C1D77B21682
	for <lists+linux-clk@lfdr.de>; Fri, 24 Nov 2023 15:19:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A7162E836;
	Fri, 24 Nov 2023 15:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="atYfbph+"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E844171D;
	Fri, 24 Nov 2023 07:18:59 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3316c6e299eso1335675f8f.1;
        Fri, 24 Nov 2023 07:18:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700839138; x=1701443938; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oVZXsVyggnQQBeZou9kqJ/xLa3R34SntugSTM7Apkww=;
        b=atYfbph+gm3gERpa+4mV9KvgZJaSQ2RRGJE3629QYgCiAJ7SK41fWM/BeMvyeEBH6U
         nt+gDC+1rvkQhrMQcuLl5QEIi2gGXE13+XSXJiEgFCUXJu3/uYlkPss6Ip77/RBEkY3V
         +R7wRTsINppd2PgUXbokoWEJlG+KmyjIWaYrVyHKUu22qkTD27SkgkaKRZQMgt8OO+ys
         t6bassJ7PawJNxkfivxQfRKSuPMNX3hg2kSKRXMMRAW4R1YucFEL4jTUp4CxlXcnuWSq
         yucmQ537s2OTWf1EzawoxJvi3UBo0Sbz24NPz6x0fn3lUR8tVuxSh7RiMQO9O5unKFeN
         tsBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700839138; x=1701443938;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oVZXsVyggnQQBeZou9kqJ/xLa3R34SntugSTM7Apkww=;
        b=Al/FfzPywMKITaVxfjnd75VaWhO6e+qkhiqU7JnSmtpcHipuFIGP4520gwT0dDgzzW
         9Nv2K/sgW7ZwndkwHluEwXll0KDkUAeV8N45h1kS8yDZ0792JmapLijx77BXtNB1iSMz
         xxZf5NhlbXtOCJvELkBcIw4opQqzbdlNP/m8HxSV01BbdWxu6Jd2NytRIICIpqKHrZzh
         RwufoPfzd7NajqmsByZrpAyXDtuMEO6mEWbd3jPWSALfTQ39x5MQghcM0N8gubKxUjt8
         WeeYBgNzRuGQ3UVgsnahERewMszx/MYwh83F/e9/VYn/KRtXzM4YqmOe/jbV7y+kWA3R
         XerA==
X-Gm-Message-State: AOJu0YzZC75SI52B9ihg9/qKg15cXjW2eravwxaMC2aKyzvRDIoY/kfL
	F5cDu0gQpSvhFmCLN9kXaF8=
X-Google-Smtp-Source: AGHT+IEfFoMOk/AAm4HKDjSM09wxomJAmCiy8eFqTw5kSVLp81Bj3hoLeWWuxaoMSltXvRxKDWFvyQ==
X-Received: by 2002:a5d:54c3:0:b0:32f:7c27:423b with SMTP id x3-20020a5d54c3000000b0032f7c27423bmr2551373wrv.51.1700839137449;
        Fri, 24 Nov 2023 07:18:57 -0800 (PST)
Received: from localhost.localdomain ([78.209.42.235])
        by smtp.googlemail.com with ESMTPSA id x12-20020adff64c000000b0032dcb08bf94sm4513699wrp.60.2023.11.24.07.18.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 07:18:57 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v7 1/3] clk: qcom: clk-rcg: introduce support for multiple conf for same freq
Date: Fri, 24 Nov 2023 16:18:45 +0100
Message-Id: <20231124151847.1915-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231124151847.1915-1-ansuelsmth@gmail.com>
References: <20231124151847.1915-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some RCG frequency can be reached by multiple configuration.

We currently declare multiple configuration for the same frequency but
that is not supported and always the first configuration will be taken.

These multiple configuration are needed as based on the current parent
configuration, it may be needed to use a different configuration to
reach the same frequency.

To handle this introduce 3 new macro, C, FM and FMS:

- C is used to declare a freq_conf where src, pre_div, m and n are
  provided.

- FM is used to declare a freq_multi_tbl with the frequency and an
  array of confs to insert all the config for the provided frequency.

- FMS is used to declare a freq_multi_tbl with the frequency and an
  array of a single conf with the provided src, pre_div, m and n.

Struct clk_rcg2 is changed to add a union type to reference a simple
freq_tbl or a complex freq_multi_tbl.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/clk/qcom/clk-rcg.h | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/clk-rcg.h b/drivers/clk/qcom/clk-rcg.h
index e6d84c8c7989..c81458db6ce4 100644
--- a/drivers/clk/qcom/clk-rcg.h
+++ b/drivers/clk/qcom/clk-rcg.h
@@ -17,6 +17,23 @@ struct freq_tbl {
 	u16 n;
 };
 
+#define C(s, h, m, n) { (s), (2 * (h) - 1), (m), (n) }
+#define FM(f, confs) { (f), ARRAY_SIZE(confs), (confs) }
+#define FMS(f, s, h, m, n) { (f), 1, (const struct freq_conf []){ C(s, h, m, n) } }
+
+struct freq_conf {
+	u8 src;
+	u8 pre_div;
+	u16 m;
+	u16 n;
+};
+
+struct freq_multi_tbl {
+	unsigned long freq;
+	int num_confs;
+	const struct freq_conf *confs;
+};
+
 /**
  * struct mn - M/N:D counter
  * @mnctr_en_bit: bit to enable mn counter
@@ -138,6 +155,7 @@ extern const struct clk_ops clk_dyn_rcg_ops;
  * @safe_src_index: safe src index value
  * @parent_map: map from software's parent index to hardware's src_sel field
  * @freq_tbl: frequency table
+ * @freq_multi_tbl: frequency table for clocks reachable with multiple RCGs conf
  * @clkr: regmap clock handle
  * @cfg_off: defines the cfg register offset from the CMD_RCGR + CFG_REG
  * @parked_cfg: cached value of the CFG register for parked RCGs
@@ -149,7 +167,10 @@ struct clk_rcg2 {
 	u8			hid_width;
 	u8			safe_src_index;
 	const struct parent_map	*parent_map;
-	const struct freq_tbl	*freq_tbl;
+	union {
+		const struct freq_tbl		*freq_tbl;
+		const struct freq_multi_tbl	*freq_multi_tbl;
+	};
 	struct clk_regmap	clkr;
 	u8			cfg_off;
 	u32			parked_cfg;
-- 
2.40.1


