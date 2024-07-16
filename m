Return-Path: <linux-clk+bounces-9654-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D25193226D
	for <lists+linux-clk@lfdr.de>; Tue, 16 Jul 2024 11:05:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 488FC283262
	for <lists+linux-clk@lfdr.de>; Tue, 16 Jul 2024 09:05:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61D92197A6C;
	Tue, 16 Jul 2024 09:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eatueIt0"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77954196434
	for <linux-clk@vger.kernel.org>; Tue, 16 Jul 2024 09:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721120734; cv=none; b=SYAZxyht+tH6eyHqmOxsZp8jefHIfLL93sBvFttz37drehtz36i5LqY4DrkNulJPs1mHRjLL2++uHpNo5+jWY0vojrNk6RYdb8V8SHkfM5w7/jVED7fy1Y+hYSpY6Q9PL++7P+pV0KRlO1lsjA5Jar6cZTWQZR+YXkUpPW8Mjwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721120734; c=relaxed/simple;
	bh=K4qopZuHyTDSk2KluGBLlK3j0kf1sZEkENg55H1Jcqc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Ef5WqcxCZyAcHuj3Jw/vBa8lzPLGZnIuMW8dhHS/npDEzZXjoqo3IGYfx0xccaWozqnu2x0haDETgZ1j+6oYsqAYInxhMCwtk0pZwrdReOfieRM5hy8nDt8yXWBdPTygguLS0crlqN1OQ5aEb6xRb1ZcGCQyo6YoB79NDzCKfMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eatueIt0; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2eeb1ba040aso69451421fa.1
        for <linux-clk@vger.kernel.org>; Tue, 16 Jul 2024 02:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721120729; x=1721725529; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jf2WfRllOxChBMgvlyNJcOnAlQ2heqm3JeAVDQN0NPI=;
        b=eatueIt0EaCWpH9DIpEpamn1ocpnp03c2ZGON2TB8KK9b2lEZi+hiWvCAKDel5Nz7Z
         1p7XKhVyTBCUMdVwAY7cj0gGrGZWoEwGDM40EtSsRfqmsm7w1+8+qgS8ytHMIwXZJpdT
         kclDX/nYyugmptBXfBsuuzRG+pwEhGTT8anioKvBoC3n3dyWukYPlWOYfoUZ0fHM+zkk
         Lpq/k6+wGa4rPvG/HSQpcIRIu8zxham7z9CcRRiepZy2Su00TkNg1Ha/glDs9js8uc15
         V/FD7eOajwA1BXuv+lXj4M8QbxoC8LmwR62cKpSxwhGT5sx1WdB2Trr8D09rCs0VkzVM
         jg4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721120729; x=1721725529;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jf2WfRllOxChBMgvlyNJcOnAlQ2heqm3JeAVDQN0NPI=;
        b=ceVuoeQzAH/E9wAOqZtYQxH6ihgXeJU6xLCqv5m0WQJaBBOHhrwrREEMaY1JkaV3Mu
         3KVbw0N5WXiIzQWd4zHWhH8Hrml+ZmXSgeFbhIKBBzsILFDwNOYnDnhWLk+S4VCAxSMK
         z7yNl9t+zD47xuPUP/1zherOF6lCKtYuCNNkukPE5/T94CtzrZgAVCSMMFBqM2hPSTA2
         evam+HadWgY2UPN4iqEWk1fT70j4bWn84P9rBQ/s0YhA+TCn1ydkLmlnMe8744wt5G/l
         UpRLoCFDeEQ01+qyYJe+Pm3Su+m/OqTGYZ0JkqHQoqWBcja4+z9dc1ejZaaO10OSjiPb
         UmdA==
X-Forwarded-Encrypted: i=1; AJvYcCXGtYiJZD2xAMY03KM6aWhQpDIYlKI1TABoIIA0CcJABgbEE4WQVE2WKkBMLW6p7d8GKe0Sc2Ulz30GyRdyVNuyWuC0qbjFovBA
X-Gm-Message-State: AOJu0Yw5s/uR8xPMewksjJ0S1T502WNTJoiyb8c+bgR6OuHYY6is2YAo
	+wR4vRFOzBzgyGteCtLA3LJIZuIMolfdUjeAZzhLqJ0uiftTg7RmoWBsL0Lc2Pk=
X-Google-Smtp-Source: AGHT+IHHak8n6yT3N8LT8mtHe9pF8I4RiujzyfDoUVdMYvPPxMDaRxKaa0wCJbw9x8vjyi4h720V+Q==
X-Received: by 2002:a2e:91cb:0:b0:2ee:8b91:b331 with SMTP id 38308e7fff4ca-2eef419d7b1mr10781331fa.23.1721120728710;
        Tue, 16 Jul 2024 02:05:28 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4279f25a962sm148687875e9.12.2024.07.16.02.05.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 02:05:28 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v3 0/3] clk: qcom: dispcc-sm8650: round of fixes
Date: Tue, 16 Jul 2024 11:05:20 +0200
Message-Id: <20240716-topic-sm8650-upstream-fix-dispcc-v3-0-5bfd56c899da@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANA3lmYC/5XNTQ6CMBCG4auQrh3THwTqynsYF6UtMInQpsVGQ
 7i7hZXudPnOJM+3kGgD2kjOxUKCTRjRTTnEoSB6UFNvAU1uwikvacUZzM6jhjg21YnCw8c5WDV
 Ch08wGL3WoJiUJRWNplSQzPhg83efuN5yDxhnF177YmLb9Q88MaBQt1zWxshOa3a546SCO7rQk
 01P/FMsfxB5Fo1RiolOtJzWX+K6rm9b5G+qIwEAAA==
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1317;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=K4qopZuHyTDSk2KluGBLlK3j0kf1sZEkENg55H1Jcqc=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBmljfWDPBodTtdMA8yGGmPeYh7HI7wCoAKPggYh2q/
 +y4ZTeeJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZpY31gAKCRB33NvayMhJ0RZnD/
 98XjYJ9YzzcGJbhKoO8OKdR93pOtukEMkMTG12SRGCXnCi+DbTDawbHVZKGt4FPpS8aY9xFCcNcYlL
 WIz7NloybM3djGj5HW0ahlkqiqeuG7AWX1Jzp7lWChfNuzH4wtZCbzXKheCfYHGlbUmvRYABVtZV+V
 kMTheaD/Ntgy8fPuvFERJITqt8wOhq5U4/BH9awc1uayX3MVSW9CN2Q6urQFxqP8ODqKMgkpppZOwl
 AZEcCjuzmIwyf4iFHbeV2A78Esozoq2kigw6dD2qHlv/mxw4QfWlfTsYFHoGB4ZqGl3LTtspiMc3ms
 IcaaZjxSzlPjvwUzWww8iKegG9OVhSObxj3Qca41IAARotPj2yp05KDGCZ507PmGYQV8iu/Oh07gg8
 UhS/Swqoex7VthYtp+2aOa+zn40EFaW6t76wc7HWQMU2Mn7GP9HkxEywh1VeDBgQaJy7vI3TXlxU0p
 ZmIEVv1PpyQDOdzPq+Q03c2YsBoGkYxw4twDfkggD3f4sNdUShXJLh6yEVfWCbWdFXXCcWpx4NIFca
 UMTbXJK5VF+3aHBFC35HkEoYBaSWsrOO3mx+jGxALARnHg9VKHFzfG2TRDebr7AFEh8n9BZJ8WKEMI
 eNzuEeVLs3vHfAfvjHqFdihydILsfZ6ImWQLjuh80+kT88UyKrVrdrvI08tA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

While trying to fix a crash when display is started late in the
boot process, I ran on multiple issues with the DISPCC clock
definitions that needed some fixups.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v3:
- Do not switch to shared ops when the only parent is tcxo
- Collected reviews
- Link to v2: https://lore.kernel.org/r/20240624-topic-sm8650-upstream-fix-dispcc-v2-0-ddaa13f3b207@linaro.org

Changes in v2:
- Squashed patch 2 into patch 1
- Dropped shared_ops to disp_cc_sleep_clk_src & disp_cc_xo_clk_src as Taniya recommends
- Dropped patch 3
- Removed  wait_val fields updates from GDSC, this requires a larger solution
- Link to v1: https://lore.kernel.org/r/20240621-topic-sm8650-upstream-fix-dispcc-v1-0-7b297dd9fcc1@linaro.org

---
Neil Armstrong (3):
      clk: qcom: dispcc-sm8650: Park RCG's clk source at XO during disable
      clk: qcom: dispcc-sm8650: add missing CLK_SET_RATE_PARENT flag
      clk: qcom: dispcc-sm8650: Update the GDSC flags

 drivers/clk/qcom/dispcc-sm8650.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)
---
base-commit: 4f40be61af99a67d5580c1448acd9b74c0376389
change-id: 20240621-topic-sm8650-upstream-fix-dispcc-a1994038c003

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


