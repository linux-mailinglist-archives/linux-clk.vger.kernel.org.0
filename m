Return-Path: <linux-clk+bounces-23977-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7E5AF5A08
	for <lists+linux-clk@lfdr.de>; Wed,  2 Jul 2025 15:50:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 56EF2168AE0
	for <lists+linux-clk@lfdr.de>; Wed,  2 Jul 2025 13:50:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A55A27D782;
	Wed,  2 Jul 2025 13:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="3K63wgx0"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF293253F35
	for <linux-clk@vger.kernel.org>; Wed,  2 Jul 2025 13:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751464197; cv=none; b=N+sAc30yvpGcEqq0s3h/T7ibpyRf8+qprQdUHpHv08xhIBWX9DHBQ095B3G8FiqYD7/GL21nXGCWoGAuNJlgoAwAu58xtEunb+M6A9GFsX7hu7qHGuH/izH7iBZLI7U8ejsmoraju6edtQC1LmWo4FMuSTtei1NgmGdVe0hoeDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751464197; c=relaxed/simple;
	bh=w7Xyb40cJn24nN7twBJleYXadnkJ+HhRYSlYtmT9oX0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YwRnlNU3ePzwMJu2z6PmVf47lrXmvgLa8mk+Eq8x0Sar0ulI18k5FbZs+6QakuCgR0to2gze5HwBNVeAwzG7b/+n8Rbo5Z7craTvvoEoLuqA0wYJ6/YOUXVcCdc68aXiSJBMxmbxy4F0iTwQpFSxJjVRhGsTWaFWXQnO01ae/uQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=3K63wgx0; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4537deebb01so23673475e9.0
        for <linux-clk@vger.kernel.org>; Wed, 02 Jul 2025 06:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751464193; x=1752068993; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tp6qbi+ZUsoL8Zvytk6fdxJM4TvJdtmSvks0lRTguZA=;
        b=3K63wgx0kjClNkPRLLN6rQXGVANDR0ScVQwCYi6iPF1hEtRqqa3i+2Hhv3b60xdk1m
         mUKQML+XOJJyr8dxdCuh+B7dCYueI3zAtgLT+OX4xQ050gcuJAfB+2royXCnivDRjaQS
         CkIMkB/Y5XLSmtD0xyB+3BpPmHq/emlqjziZOUm8TOmmPgMyUtKUoDfgjI4Ir4xg7Fxo
         vme0wAIvMAqYxLOu04KFh/LPOdhrbpInlHhxbmMoW2KOnnV/948ZEQjEC9rsl0k408Hv
         jgs6MA9U7bswb76ko5Qec4Fj/Ai6emwYj28OdhLV42CpXB47cC93vdxMtun2UFZ8dmdx
         P/rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751464193; x=1752068993;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tp6qbi+ZUsoL8Zvytk6fdxJM4TvJdtmSvks0lRTguZA=;
        b=Z/8h8F6DN/0pKC+Jle17ffkjpeGEtvI4uCcuO6vVDuawEDqpfl6q2Ol54VCAzwbc1K
         aX7ahdAatum9f+bfk5XzPTZaNHjW7uBybNi7CRN+HqARDFZIgltzL+RDE6dxIWk8oiJf
         GJF5dWat1Dg0y4zu+LLddXvRp/vdcgTCPORhYnxXLJGqQkdLE86Y2B7dsAKdWxbTchrg
         vc1V0zHyaW0jYWyGKDY9PftiIIsEoaJGJBN8jdUTVmD9/rvxPTUrXKFQtFe1lcN2YTPZ
         Qi3jql8n682W7ZQHm+zEJOluDze977OnAOTm6WD4UE2lDdspTT5Jmzq+6hnrgKzA53u5
         lebQ==
X-Gm-Message-State: AOJu0YwUpD/CIez1AlfpoU6TVoHfxWPW53WwdV5EAlVLNuTmnkKxefqp
	8oiFlTk4nTKKQVrt07dU9kU6iq6KwmtjRGOzwJm3lyyOYg01wtgsT1FBU9dIPiC5/dY=
X-Gm-Gg: ASbGncuuKUl5EPABW0iXnAOQe3gAhjBNCYyiPVSrjH3XGlb1Yu32PhIlE5e+7sC2sR/
	Dj9wX/HFQFqGM90GQ/fA9qhWKyAb9LAHMBAYxlZp0f31YqDnvmJKayThi7usu5IeUGJB2/LP+tP
	Rr50YNp/68iiNadyP7vFyPpgivjuq8hwv6d+xlM6KjVdPTIRnQ2D+3ffSEN9LUTtA83/WsW+WaB
	MSBDYMYyciSwdXel3CXU64POsR1p2aERv3FEUBn69lPzCJ4e0JfcmPm277Nxr2wcBvCBvFJ36/e
	aUKHAWWMrW3WxMkV+pV4p0KnStBzjpK8uQvZNCkXux7l6jmPG6+zCr1dNn8kg+4n
X-Google-Smtp-Source: AGHT+IE0aYFuuB17fOVm7tTLCtf+dmCjdxDuykMapL/v/tu9OvfMxXQZ2W+1BibdIhnsoHzg8jgH7g==
X-Received: by 2002:a05:600c:3b15:b0:453:66f:b96e with SMTP id 5b1f17b1804b1-454a36e59e5mr27310635e9.11.1751464192987;
        Wed, 02 Jul 2025 06:49:52 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:5542:4bad:e07b:9489])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4538234be76sm229611545e9.15.2025.07.02.06.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 06:49:52 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jerome Brunet <jbrunet@baylibre.com>
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 0/3] clk: amlogic: drop clk_regmap tables
Date: Wed,  2 Jul 2025 15:49:47 +0200
Message-ID: <175146414026.853943.10828213278410339328.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250623-amlogic-clk-drop-clk-regmap-tables-v4-0-ff04918211cc@baylibre.com>
References: <20250623-amlogic-clk-drop-clk-regmap-tables-v4-0-ff04918211cc@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Applied to clk-meson (clk-meson-next), thanks!

[1/3] clk: amlogic: get regmap with clk_regmap_init
      https://github.com/BayLibre/clk-meson/commit/21ed19d11863
[2/3] clk: amlogic: drop clk_regmap tables
      https://github.com/BayLibre/clk-meson/commit/4cb53fff9db2
[3/3] clk: amlogic: s4: remove unused data
      https://github.com/BayLibre/clk-meson/commit/8a65268500b0

Best regards,
--
Jerome

