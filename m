Return-Path: <linux-clk+bounces-23454-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A60AE4B38
	for <lists+linux-clk@lfdr.de>; Mon, 23 Jun 2025 18:43:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CE24E188464E
	for <lists+linux-clk@lfdr.de>; Mon, 23 Jun 2025 16:38:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0AF928BA9B;
	Mon, 23 Jun 2025 16:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="jt5MlaU5"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17AF235280
	for <linux-clk@vger.kernel.org>; Mon, 23 Jun 2025 16:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750696670; cv=none; b=WOQfZY+hDCjdJR4jPGkOdxOyBHutYCGRTEIWirS6pal87KVqmlaCUEWkDX25GZRgt04f8rwLp34n82T4THLXGG4x/cEVjDMlJs9w/RPfXfI6r71HIsUZtYxWrjilIiWWvdQDOrrT1tBif5JxVQ3b6LTIxuZ+rbBk4WvhVn6T63s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750696670; c=relaxed/simple;
	bh=mYWVSmzjLjIbQDjgPKQIGCT3cgx5XlaE8wPwnDxWmfg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HAVpt8dN8EsHHlY8CuAPnOCa8YW3UoK6CQd4j8mHHhKfJX7ezcIH1+2CaI93JrY+FSfV6rVKnV6y3DzDcpdaLVo7NnVYzC+NOVXOr50+osQGD5Ig+6u2GHcxUv4N75BzQzRnxquNRMiBSxgVurlm2qfhcR6i1R449jGTATzLH84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=jt5MlaU5; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-453426170b6so32339055e9.1
        for <linux-clk@vger.kernel.org>; Mon, 23 Jun 2025 09:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1750696666; x=1751301466; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sXfU9/sKAYBBbGmHQM1w7+6Suw+kwrFKSqlLdXK/Mh0=;
        b=jt5MlaU5XsYYv+oXi7tSqHqsGUHZldZxQBZ/Ttn92OUDohsvjtEIQ5pmXccbQop6u9
         sg7lMrg+Qgs1rb1aLKVPWXvtGYRVljEVgTYmo8MIthrzQBX2mKtJp9PKvV3bL2im4MZj
         elZkqI/nEgpmu78YREk3XDpzKrxyM0TmLpOdcIpY8ah3vg+2Nc6nLQEBBeSnyBmQnuoK
         ScKTDQ72pncsHh3ns9igyzgb/p2y4717EYcN2C9NFnFK6Dmb3z5B9fMqWpcJ36Mz3Gi5
         pHkvYAFFvvYnuuZAFeigitiIuAujJoMY6vm0afobdVkktdpXfUD8fiYZOKOjfxIOjjwJ
         TAeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750696666; x=1751301466;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sXfU9/sKAYBBbGmHQM1w7+6Suw+kwrFKSqlLdXK/Mh0=;
        b=eFQkgNMyM64oxC8dp9q6DQCoiutLx+d6sW4kxQetPI5ksQa/iWkM2uLhyqkkK/4vZD
         Ca4StJlqtcXgwvaMvC8ESKODYDu0p+PF4MwLwrYpOrGbGYAjs3tt5yezKz6jcS+jRcx7
         t5MOyrS++yyS40qi6FXIlXQPWuHEdympBb6SpmV9OjElk53x2p8K5wenNqPPupkEDHKX
         SEQJqEf6CpK+1kpJHMqR8H43ptJ6pN+KZhpNHBxgdfR5HRcWO9ju9qmEToz5lFtMKf2n
         54TgKwjisM5Atkal8D0toZFx6MtIj/ZeVmhj05hFFnibW4I6XY3FvKkR41Jw2mxVHgS3
         hZvw==
X-Gm-Message-State: AOJu0Yw//3teDJtFvD3FCVtMu0iXSPcVX9eI4XaYg4G89obXwPBx+aIV
	Pj3HRJG3cjbsQpFpZrp+tZHaC+9l/wfh8yU2/x581UfLgdcA7dtazwignQihNCRhKIatz8kVqV0
	U1SVO
X-Gm-Gg: ASbGncu8W//J56welVHBxzsjdTdZCK9KgvS6wzgPJNsY2/qSPjYEY0+A+rgVa6J/qTW
	Hb0Fk+OT70SSG2uGUiHMZsr1w1H/GI+VeDCyMpjjCGZqxRR1XrgEs4DRUOcF/R4elnX91ArfiFg
	ykSy7CWaHNt8KkiDuVV8jvzwbz/gWXbUUTXi3k1KyN1VXHgpTo88AvEMAEOLxLdGE3gxqapozTD
	xzPaBAAqR0Fe+euiwsOq2WTNY3lH5/ABQBCIvcozWHUMZmQ7aQNaYj2vC2tmNuz+TDrvnkNl6ci
	IazBbmCoc8S4w0t8wU7CoLgkpgXoPqqS2k6bMHzDF1b0DB3/V5aKSW+dKr2ZfKoIqGA2PEIAEkF
	2
X-Google-Smtp-Source: AGHT+IFqfwGYY0+Dig+qJqYeoejIBa8GYHXUUVZat5Q6BxxTcUIEB+sFZBy9mHOAj+NMznzCbMGGkQ==
X-Received: by 2002:a05:6000:2089:b0:3a4:e1f5:41f4 with SMTP id ffacd0b85a97d-3a6e71ff6ecmr153014f8f.17.1750696666309;
        Mon, 23 Jun 2025 09:37:46 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:7b0f:c522:cad6:acd1])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a6d0f1011fsm9852947f8f.7.2025.06.23.09.37.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 09:37:45 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH v4 0/3] clk: amlogic: drop clk_regmap tables
Date: Mon, 23 Jun 2025 18:37:36 +0200
Message-Id: <20250623-amlogic-clk-drop-clk-regmap-tables-v4-0-ff04918211cc@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANCCWWgC/5XOy2rDMBAF0F8JWldFM9ajyar/UbLQY+yI2JGRg
 okx/vcqhkIJWSS7uXdx7iysUI5U2GG3sExTLDFdapAfO+ZP9tIRj6FmhgIlIApuhz510XPfn3n
 IadyOTN1gR361rqfC4YuUb5XBRmlWoTFTG2/byM+x5lMs15TnbXOCe/sWPwEXfK9D0Mp417rw7
 ezcR5fp06eB3Rcm/FOVADAvqVjVAK2ppjCmoSdq80998demqoAapQSp99I8qOu6/gJuN1LNgwE
 AAA==
X-Change-ID: 20241220-amlogic-clk-drop-clk-regmap-tables-18e5cf572356
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3293; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=mYWVSmzjLjIbQDjgPKQIGCT3cgx5XlaE8wPwnDxWmfg=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBoWYLVmgtUvfDevz3Z10seXSm+XFjjYfxvZSxDt
 D3zgtlL2siJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaFmC1QAKCRDm/A8cN/La
 hZ5zD/wKTXfUG9GHR7LsTVWa2bQ0Ny9ClwqlBsRKbjzPe25XXK95/Z0+fnBUE0gcokzUmNXOajH
 sOvbauzAcb4bx3x1AZwpkpEE3/lwZ8NNv7Ecun48UyYWsPEzJWu439gjg/niJ7hIXttXw1vVWwb
 o96iCZN/DNLSns99V04RUJ6j21ka1W2zS3gzxay3xhAvtUCaW4vDiXdWMfShlpCRm9KhL2OyTl4
 HlfDCMjaoBGM8+NzKaYhoMSYO/sTvRb04hPNQb3TCQIknGS2Cdwzq6bNqom3xytg4cPFvyETTQ8
 73lDcMDONg0BXIQ1W/qr2ATjh+ruRLwQZR9zL9g91i9E83VSWKyf4Ozxsx8PhHTQMZPY+5PkNOv
 xcD4yy69DwnkS2eC1otDTnPh/g4nxtUMLO3k5Bch98Ov3XFenhz+l26KKFtFYJc+O5iv/719nll
 iatKI8tUIxveTkFfRIsgtxNRpltGMIiRbsJJfj0YI61k+YfOSb2QsM6er8jlzAw3oU4IkNcNTrK
 EOkMZA2y7BLQvVDU8P7JFvC1l5afC/e6U3ShoXqgsOylTgSzHqmEUo1+1g2Q3Y+t9loEEk9OgBm
 wAwsKkNt+XMRiwJrQid9Jhr11nkvOJ/BP0RTwHhajdv2PUEItqyHIUUNW9miFTy0fDgiaAuODUv
 lA3+YVdj/o3X5Iw==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

This patchset removes the need for clk_regmap tables in each clock
controller driver. These were used to populate regmap with in the regmap
based clocks.

This saves memory and is the 2nd step in a series of rework of Amlogic
clocks, to clean-up, increase code re-use and ease future maintenance.

Note: the clock initilization callback has guess what in order to properly
get the necessary regmap. This is not ideal and temporary as noted in the
code comments. This intent is to eventualy replace this with a dedicated
location where regmap may be consistently retreived by the clock.

Changes in v4:
- Rebased clk-meson-next targeting v6.17
- Link to v3: https://lore.kernel.org/r/20250120-amlogic-clk-drop-clk-regmap-tables-v3-0-126244146947@baylibre.com

Changes in v3:
- Fix some typos
- Link to v2: https://lore.kernel.org/r/20250117-amlogic-clk-drop-clk-regmap-tables-v2-0-d1f77cb0773e@baylibre.com

Changes in v2:
- Add clk_hw_get_of_node and kunit tests for the new helpers
- Split patch adding the .init() and the dropping the table
- Drop devres based solution and something temporary but simple
  while a more generic solution to hook controller init is discussed.
- Link to v1: https://lore.kernel.org/r/20241220-amlogic-clk-drop-clk-regmap-tables-v1-0-96dd657cbfbd@baylibre.com

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
Jerome Brunet (3):
      clk: amlogic: get regmap with clk_regmap_init
      clk: amlogic: drop clk_regmap tables
      clk: amlogic: s4: remove unused data

 drivers/clk/meson/Kconfig          |   1 +
 drivers/clk/meson/a1-peripherals.c | 163 +-------------
 drivers/clk/meson/a1-pll.c         |  16 +-
 drivers/clk/meson/axg-aoclk.c      |  22 --
 drivers/clk/meson/axg-audio.c      | 433 -------------------------------------
 drivers/clk/meson/axg.c            | 131 -----------
 drivers/clk/meson/c3-peripherals.c | 210 +-----------------
 drivers/clk/meson/c3-pll.c         |  32 +--
 drivers/clk/meson/clk-cpu-dyndiv.c |   1 +
 drivers/clk/meson/clk-dualdiv.c    |   2 +
 drivers/clk/meson/clk-mpll.c       |   6 +
 drivers/clk/meson/clk-phase.c      |  11 +
 drivers/clk/meson/clk-pll.c        |   7 +
 drivers/clk/meson/clk-regmap.c     |  49 +++++
 drivers/clk/meson/clk-regmap.h     |   4 +
 drivers/clk/meson/g12a-aoclk.c     |  34 ---
 drivers/clk/meson/g12a.c           | 261 ----------------------
 drivers/clk/meson/gxbb-aoclk.c     |  19 --
 drivers/clk/meson/gxbb.c           | 393 ---------------------------------
 drivers/clk/meson/meson-aoclk.c    |   5 +-
 drivers/clk/meson/meson-aoclk.h    |   2 -
 drivers/clk/meson/meson-eeclk.c    |   4 -
 drivers/clk/meson/meson-eeclk.h    |   2 -
 drivers/clk/meson/meson8-ddr.c     |   9 -
 drivers/clk/meson/meson8b.c        | 200 -----------------
 drivers/clk/meson/s4-peripherals.c | 341 -----------------------------
 drivers/clk/meson/s4-pll.c         |  31 ---
 drivers/clk/meson/sclk-div.c       |   5 +
 drivers/clk/meson/vclk.c           |   2 +
 drivers/clk/meson/vid-pll-div.c    |   1 +
 30 files changed, 94 insertions(+), 2303 deletions(-)
---
base-commit: b7f68cdf9f2a42b88815941538446dbf4f2dd464
change-id: 20241220-amlogic-clk-drop-clk-regmap-tables-18e5cf572356

Best regards,
-- 
Jerome


