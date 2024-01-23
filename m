Return-Path: <linux-clk+bounces-2692-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD0F783874E
	for <lists+linux-clk@lfdr.de>; Tue, 23 Jan 2024 07:28:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 159D31C2293B
	for <lists+linux-clk@lfdr.de>; Tue, 23 Jan 2024 06:28:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6946A5025E;
	Tue, 23 Jan 2024 06:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WoG35ga/"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1AD950250
	for <linux-clk@vger.kernel.org>; Tue, 23 Jan 2024 06:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705991302; cv=none; b=O1DMFfEzOnhVaseFGWe8CMThxE+utwbg94P89sNtHRy613N1wf1P4qZgdYAlNIwOIsByBT0TiCEu6jT6i3TFpkMTB5Nw5IFDjyrGiwyqABERPZpKEkOvilbg0tpw7rECwd0VyscZRqByCNVg5zHe1izqBwi6J4GrpmdHOLIKdA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705991302; c=relaxed/simple;
	bh=mvGSN5uOQdpLSxdblzS+Kyroku8p1YkV6i+4w8z9/8c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MvV1Ngu3p/PiUDX2yl8nnAeF/oifz6b2/ih3nFFhgEha5Oio6Mlf3KIMyU2BOgqnbXlG01jJgMjRu+FgVmTUG7Iuu9dL0T+kCoTokt1welCAoDY6aQBureSjOx+AGhBKO1wxlqSnriCMiAkboIorEXBLfB9+fTlaZi1KpLNIbas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WoG35ga/; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3bdb42da0e0so1565825b6e.0
        for <linux-clk@vger.kernel.org>; Mon, 22 Jan 2024 22:28:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705991300; x=1706596100; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=li3BvdPJaGd7zO4rcHjt0R+2G0nMHzQJfJYUns+g7hE=;
        b=WoG35ga/qdIatirgqbBOIATBCGYRcdPYgWjbBoY3L7bsJxcYGCs8Mm11hX2zfumBQD
         1atZoeaqwEGMoQWa7CHdjSLEFJKE0Z+jrF8Gc2CqFGUx8YUW9U6w5nZYl/Gbb55Pqv89
         YFbocq5Hm3tp4jVYrrhrweB3M3m7b5AAwamro5IyISh9qF9TcGAOwqUZCsCpePtZDn/N
         62vv9zcl8/E0Bp+d7n1aySeMHsl3+PS/Z0gfRfmpL4FoRkicm3DakbzA6nAFPLt+MxCr
         GrrH7KTJEkJnzIuGP2FRz8WCfpwM/kuiJbBSwGO7PcaaMgXdBZCF9AAEZtXZtw+bmi1g
         16Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705991300; x=1706596100;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=li3BvdPJaGd7zO4rcHjt0R+2G0nMHzQJfJYUns+g7hE=;
        b=bpGP9rvF6PiDS4eZDr+Wl1dAs37lvaF9id0sUsGDCmgB3XllHbeiLJUr/9CMPe0zOq
         RmDkpshZzrpxqhxkPlNS4hI/lvJAjA1djZyrcoFJlhMw8MRJOYblHGiKe8pW/UxsyH7N
         VXJPGn9+D1yyX/WrzT81HFVZlJLFNNIXW+GopObBF53T/W/rFX2CM1RhB/VfP+BJqH1D
         jEpz93RQ6z543/oKOgboi4DdU5isY9UDflaukwkKgfW8/UuS6+gS78ds/y/ZXqjPU3Db
         DmGyhPNtpOZW+FTqLwveb1vWbnSoc4RlRHrgSLPluMT1g3fzpwF7JQsZZX2gDtGLTEGx
         evlA==
X-Gm-Message-State: AOJu0YyuE2vIr8MrU1/Og4NUSKA7cVbh7yj59ZovKFuF2Kp2K/9aZMcO
	OseNPLJzn4OErbfddZKFwJOMteFPntBDcU75LcvVUy45udopbiw9y7WbV41/hl8=
X-Google-Smtp-Source: AGHT+IEE6NYJUUZo1MHOAb9vyXoaJsRCOqjIqYlRHXQQUQ5WgJbzwERpTVKmo6uPWT0uPwMEGd5KWA==
X-Received: by 2002:a05:6808:1991:b0:3bd:bcd2:9e2d with SMTP id bj17-20020a056808199100b003bdbcd29e2dmr2252929oib.33.1705991300075;
        Mon, 22 Jan 2024 22:28:20 -0800 (PST)
Received: from x-wing.lan ([106.51.165.154])
        by smtp.gmail.com with ESMTPSA id r3-20020aa79883000000b006da5e1638b6sm11062657pfl.19.2024.01.22.22.28.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 22:28:19 -0800 (PST)
From: Amit Pundir <amit.pundir@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] clk: qcom: gcc-sdm845: Add soft dependency on rpmhpd
Date: Tue, 23 Jan 2024 11:58:14 +0530
Message-Id: <20240123062814.2555649-1-amit.pundir@linaro.org>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With the addition of RPMh power domain to the GCC node in
device tree, we noticed a significant delay in getting the
UFS driver probed on AOSP which futher led to mount failures
because Android do not support rootwait. So adding a soft
dependency on RPMh power domain which informs modprobe to
load rpmhpd module before gcc-sdm845.

Cc: <stable@vger.kernel.org> # v5.4+
Fixes: 4b6ea15c0a11 ("arm64: dts: qcom: sdm845: Add missing RPMh power domain to GCC")
Suggested-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Amit Pundir <amit.pundir@linaro.org>
---
 drivers/clk/qcom/gcc-sdm845.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-sdm845.c b/drivers/clk/qcom/gcc-sdm845.c
index 725cd52d2398..ea4c3bf4fb9b 100644
--- a/drivers/clk/qcom/gcc-sdm845.c
+++ b/drivers/clk/qcom/gcc-sdm845.c
@@ -4037,3 +4037,4 @@ module_exit(gcc_sdm845_exit);
 MODULE_DESCRIPTION("QTI GCC SDM845 Driver");
 MODULE_LICENSE("GPL v2");
 MODULE_ALIAS("platform:gcc-sdm845");
+MODULE_SOFTDEP("pre: rpmhpd");
-- 
2.25.1


