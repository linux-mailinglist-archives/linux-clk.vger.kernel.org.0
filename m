Return-Path: <linux-clk+bounces-22358-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C6BAC67C8
	for <lists+linux-clk@lfdr.de>; Wed, 28 May 2025 12:54:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 95FF51BC7003
	for <lists+linux-clk@lfdr.de>; Wed, 28 May 2025 10:54:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 772AE27A47E;
	Wed, 28 May 2025 10:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="nnJeqQi3"
X-Original-To: linux-clk@vger.kernel.org
Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E8A21322F
	for <linux-clk@vger.kernel.org>; Wed, 28 May 2025 10:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748429651; cv=none; b=C9wlHZdUWPgxvDUwvGuypxZ6V4dIxWmvlE+DrKUk2Jm5PYuGp8BKA4IPBotdUwkJwwwzKiyvlkf0167hsbNnrrR9YM06vuZqBJpytjIiQsokdLEC1luOTypSMoufpGO3QCGFXs+31tInxCIZrSajw3RncgT6gk1gentuOq5ukio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748429651; c=relaxed/simple;
	bh=P5UNf+zad20y7Zm/Q5xw4JbkbAaKqLePPnMsQnYWaNE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=K/wDhufaXybBpLBWN8I1vKqGDDr8XsvvatpuaVqeRHDdkUoHOzclpyfVE5W7FZdD5ocnftPow6UfpotK0YU7a9WPhHFDIMD3rR9gh0ZzAo+Y8bqNy2d023Y2hz+bpVqLV5l1PIwMDLCGk3ShVacvHw/Kd+vXT5IBZGKLLvi9Q2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=nnJeqQi3; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=nnJeqQi36M1JUBeNUekhtBJzrhCM26XoWxcgYcaYP7fXq+cYBNZ90x0c54Lcrx6s75XKMJ1vTVnxBYP4+ZmTc3uiEpsmpL8AFJofttLAaZsg7ofN1zC7EecoC7EcGUFhi74TxnXRl9QErcPUd0xUi8Gx1RQxO6xDZ7ZcM0AGjTUGVcWQyY6dGdWLuEU8cxVVyZ/wGDdLFwShwCS+8QRicaVAdOrU4qXimmtsKAONc6uK/XNGi4GDDsfMpbK76rt0aGai84ddVXpYaVvU1fGoMYNYNaDb3cfr16lboLzCzBOSWGIZ6bBOFFjIZbzPrfm6/W5OptdklnSNyQwgwWJ/LQ==; s=purelymail3; d=purelymail.com; v=1; bh=P5UNf+zad20y7Zm/Q5xw4JbkbAaKqLePPnMsQnYWaNE=; h=Feedback-ID:Received:From:To:Subject:Date;
Feedback-ID: 68229:10037:null:purelymail
X-Pm-Original-To: linux-clk@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1157235224;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Wed, 28 May 2025 10:53:45 +0000 (UTC)
From: Umer Uddin <umer.uddin@mentallysanemainliners.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Igor Belwon <igor.belwon@mentallysanemainliners.org>
Cc: linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] Add CMU_HSI1 support for Exynos990 SoC
Date: Wed, 28 May 2025 11:52:50 +0100
Message-ID: <20250528105252.157533-1-umer.uddin@mentallysanemainliners.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Content-Type: text/plain; charset=UTF-8

Hi all, definitely long time no see.

This small patchset adds support for the CMU_HSI1 block for the
Exynos990 SoC. Gates are not implemented as we can make use of
the HWACG system set up by previous bootloaders.

Best regards,
Umer Uddin

Umer Uddin (2):
  dt-bindings: clock: exynos990: Add CMU_HSI1 bindings
  clk: samsung: exynos990: Add CMU_HSI1 block

 .../clock/samsung,exynos990-clock.yaml        |  27 +++
 drivers/clk/samsung/clk-exynos990.c           | 221 ++++++++++++++++++
 include/dt-bindings/clock/samsung,exynos990.h |   7 +
 3 files changed, 255 insertions(+)

--=20
2.47.2


