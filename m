Return-Path: <linux-clk+bounces-28805-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D31FBC3AB7
	for <lists+linux-clk@lfdr.de>; Wed, 08 Oct 2025 09:36:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A06A6404A94
	for <lists+linux-clk@lfdr.de>; Wed,  8 Oct 2025 07:36:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81E812FB96D;
	Wed,  8 Oct 2025 07:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UgtUMGtJ"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D172F7ABE
	for <linux-clk@vger.kernel.org>; Wed,  8 Oct 2025 07:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759908709; cv=none; b=qWhml9oMT+2U0Wkm9vbw5jg7Zk6m0RNpdiJQenPVF5OY7GtFftJR63a58rLvh7XQThFkI1XNgH7dXRXwoXEAcHpJG+/8aNPQtNmtYlQ2GGNYAkcN+AyCqfTmwo6JLfe624h+gATqP5EUxHRQhRXogHtPawqI9S2uVODac8yeUkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759908709; c=relaxed/simple;
	bh=vH0xJgN2W2szoe//wNhYvtT1BAPozP86dafTWttSucw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Lgwn8WbpYvUmg1AA9KqPSvYUhZ7ibXL1YnmVdWUD6Kd7edmG/OjsYdngix2n+O1JT4ePJBYHQ2e5/0luMrAPNIxmOz/bUnKbqYFseKL6X4CpOBKgJDRN/K50GbTdBmAMJJ+ngV4e50+X9gRcWS/BTMEX4XseLEDEGAE5R5ucSK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UgtUMGtJ; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-57da66e0dc9so7017267e87.0
        for <linux-clk@vger.kernel.org>; Wed, 08 Oct 2025 00:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759908704; x=1760513504; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PAqyge5iPysoNexKPCog6vdhewd7fraGc+GRNda+uus=;
        b=UgtUMGtJ9B+N2O21Y+jSRt+4OgEV8GiFvrxDyzmZEuw6exygeDYLw5T3LyQw7gVpHf
         Q2MROoD51mYc1G0B68OaIOiA6D7ZQg29QcjrYNmvyOC7H91Xzvty21xo9j4uCTZ8Dj56
         fLMLU+jbyv2lF2+peTG/WrMVHu0of1445VynhOocEtMg92hnVLHLB5FdiJ8KQvj5vUDJ
         jtPo5ecGjORLxGDrE3sLG1R6C0VGpaxPZ9sqVHVXdK0ccnAy9tBScmss6rmDvVYl+JPA
         UZtm6CqB9up8ndiDNe/2a0+64XQ2D3apB6DHFyE5tRcIAV+/8gYopKCaiPCdUhAiw5/P
         Hbqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759908704; x=1760513504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PAqyge5iPysoNexKPCog6vdhewd7fraGc+GRNda+uus=;
        b=leYENW9aZeNzfG3aP6W5DiXUxPzti1Pbeb1mCYqYwGNZ339lupiRo2ZxVTMzGUxZsB
         Ark2uX8I3hXffoC6KWaGJckWbgwAE3ynpWxkoekxS8BIC9hqHDO6kT8U9rJP3PXooJLU
         q0+Q5fhgG5p1rYK9QsyF9OS//ExUrSdD0Q+MtGjBceFo1BRKM8XeGIpjTQ13oiVJexh8
         kKGJmGsYa98Vxpt/mMlD4G1wJ3ZdvwEtIJpsQYQ9FL5WKDHb6+HlQRfLlssI5d7Vi6PL
         RxH58zk51H4udbZQ3fWuTzG6CX8SmuGIbyINCcp6TxIPYurEj30QnhyaYzm0nWQ6Nzwx
         61pQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTtwXschppMh7Q/hwI00ROfLrWbVtW6horotNFbGOES2kgOv88FVGNG/7YK+z0d0g88NDXnThejII=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRIuIs+9Fm3dneA98LcrKIUL3p+8Kyv7lHLSsKsbKovmfaSY3F
	a5liAK69OgQJEaTCIxjITt+4DhxNE1H6r5mMW41hjG5K36tTJNvPmnFE
X-Gm-Gg: ASbGncvLhqXafB/dJhZ4621QFUt7iSKPddexbFWf4uymt6nOI/Re2OhQIcJ52m9Phsw
	g6Mu8XQE1pk9lFJhbcXTxQpXT7vZvDACFerYKpRQPXo6C1+1aK8tGeD4Dp2vMB9pPM/rLKuHY5u
	jStmKBfoiRMx1poxNj53aLS0zK+hgNPKOtFMQKazp2RJeQryPbtOFHgg0wY6QZ55ov3VlI5OLHU
	BPoYVbYCCsr5D9D62k4CFQtsP3hH2/pkhzmrlMatLxcSvE1gJXg6ezax4OMbxpxhkjPOi7Fmw+r
	A+mvrGvxVF7+n76QX+qIMwseTRr0qC3UvDj7bAYAr4LWIGuEKxEQt/Hdy3ctvhGHYdfjW12LtTO
	QOupMMoCVKJmsguqBhhz2AxG8e+c24QkVojIWeQ==
X-Google-Smtp-Source: AGHT+IHW/s8/FSLeLjY2E3RMDJLZGpJL6irCGCDXRSSnmLe1/pIzWAPaX9pmCT2OHt3ka3/mSzeg5w==
X-Received: by 2002:a05:6512:2399:b0:567:68ad:428e with SMTP id 2adb3069b0e04-5906d888441mr673178e87.0.1759908703855;
        Wed, 08 Oct 2025 00:31:43 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0118d22bsm6911016e87.85.2025.10.08.00.31.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 00:31:43 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
	Dmitry Osipenko <digetx@gmail.com>,
	Charan Pedumuru <charan.pedumuru@gmail.com>,
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
	Aaron Kling <webgeek1234@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v4 18/24] staging: media: tegra-video: tegra20: set VI HW revision
Date: Wed,  8 Oct 2025 10:30:40 +0300
Message-ID: <20251008073046.23231-19-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251008073046.23231-1-clamor95@gmail.com>
References: <20251008073046.23231-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to TRM Tegra20, Tegra30 and Tegra114 have VI revision 1,
Tegra124 has revision 2 and Tegra210 has revision 3. Set correct revision
in tegra20_vi_soc like tegra210 does.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index ffaaa2bb8269..93105ed57ca7 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -596,6 +596,7 @@ const struct tegra_vi_soc tegra20_vi_soc = {
 	.nformats = ARRAY_SIZE(tegra20_video_formats),
 	.default_video_format = &tegra20_video_formats[0],
 	.ops = &tegra20_vi_ops,
+	.hw_revision = 1,
 	.vi_max_channels = 2, /* TEGRA_VI_OUT_1 and TEGRA_VI_OUT_2 */
 	.vi_max_clk_hz = 150000000,
 	.has_h_v_flip = true,
-- 
2.48.1


