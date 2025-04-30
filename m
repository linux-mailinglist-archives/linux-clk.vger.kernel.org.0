Return-Path: <linux-clk+bounces-21176-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B229AA47C8
	for <lists+linux-clk@lfdr.de>; Wed, 30 Apr 2025 11:58:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ABDD01C01810
	for <lists+linux-clk@lfdr.de>; Wed, 30 Apr 2025 09:58:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C08DA237164;
	Wed, 30 Apr 2025 09:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="QVYK/lnW"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D09231859
	for <linux-clk@vger.kernel.org>; Wed, 30 Apr 2025 09:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746007107; cv=none; b=VdhPxEFvASXdUIJTQvDiyyg/NqCwFAUpsvVQP2QVtAJao/rNYjHTomceS31NjdKrZ8UvMNLyzh231jpDCimKDEEAosgePMLVxVzgmT/VUT8VAGwS8NfpkXHlgIcKucWa10l7VjpKP6qTQ0NDtl1ZdXrD/XajLpys5uk2qVF0ObA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746007107; c=relaxed/simple;
	bh=QdSfLwYCjEBwVvV1+m4B+Wh80A5f4PCVAxEhB2M5NWE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZAfBU2PkOsXrdye+FrSf2RHfGqO0KlG4lzEMyCSr3xgrX5z4tHXElUL9emJIwMlTP56lIa6olFiPX8Ud8YJSX7XXPhKWlQHkH2d6FfZhq0PJjQb2nq8nFBkLzOAfkvtWTSn3BGZcCGsxxxxK0XL0s+q+njg0HCRWRaleqUebJVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=QVYK/lnW; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so64589585e9.1
        for <linux-clk@vger.kernel.org>; Wed, 30 Apr 2025 02:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746007104; x=1746611904; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aPXTmnK0+GdZlxWfqgccGBwo5OJjJ+W0LMQCLb4H9vU=;
        b=QVYK/lnWftAlPVcb9Il4gjaSJ1TA2n+Nv6qj2htUkHEu9Ycdf+SuQP7IfeqZB/Ypnh
         QIP1lvYSbUid28lqebhBAfeU7hpTpLD8gBNs09AnluiOtdS7xK7EetlK0XAChFYkG1Ol
         tWpti2lAFGY2T1w5LDmOughhbvLEEKZv0qBs8jgJTfDq72QqFmxi8XmEoUNKjt9NdBlS
         fNHvrNtuk7c/otZHQ6aGr2lPANwWkOP8JAyV3lK263VasaVL2p2Wzwxx+Np5iD+o+7ur
         3lcWCtKgp2/jZ+laR2wwW3s2ZXsJBq2W6zJdBuU3k6z6nGwiGbwBpcjsE75OJCGLdqrM
         JynA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746007104; x=1746611904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aPXTmnK0+GdZlxWfqgccGBwo5OJjJ+W0LMQCLb4H9vU=;
        b=jGdFZXgbDlTc+YMIduTIC9/3d/7Y4iDf+n6rFjnmVxxohZEd6BLVTte/lB3zJ66zH+
         k94ZJbJXOP6Nx4Uda4BliO29sPq/mHuaJxU6aHaimkpEJ3nCpVPHPMbTSGh/Bdt5W1xi
         znUZys8gO5FGMoqPkjfWQHVCd64owXNG3hoe8acHqoh+lpSpMxAIVfHpjLZj0W3x5b+M
         634pxYjvMtkMjxTDGdQhCSmtSgDYIwOqsGO6SY4dhIYFzhMQmyTUB+rBRL7aG5zut7u2
         bY/DcyicbYBMA7989Pe4wuATjif2ds5VvOpyDHYgj68Q0kbU30xQeeJtrWhNam38dTe9
         1wSw==
X-Gm-Message-State: AOJu0YxhiWYHLoTpW2IrTnxkanDOQETm410mB34Xqqx2kGS5O1W0gejv
	aKNujWQtysTuj68y1mXEqtbUK7QNSj7Hd41GKOmzHzFms3rVGrv6eOyJB2xmrhw=
X-Gm-Gg: ASbGnctF6ZA9oUmh/PYgoS8qc9EK5peOAzLC/M2irjCylBEQk5yvB4J4nsv0MCRRwHG
	bbk16cHLrSxQEJfTmToUkjcElgG54D/rw+5oB1ZXU0T+/qRV564orbTSN1xQUoD02qmt9YEdzkx
	Gj3SltWhcv6ZNrPd68cbsOdHqYRCyqJjmzW8aKYjYm4slgY/FqeaV+JP8iapDsoSj7sMRSBnuOa
	Mz9ALYIRyGm0bAARoPY2jQzKau8kcH/rdfaQFK1PNQAbh4deyHIq/vPZVtM8FIdsnogwikGUa5F
	t7i/qVbWrOCP1rUZCuflpCXYEjJM5yfaHvqhwQeZwDEVPurQjVf4t/HAkkCVjNYo5jGYEkJncBY
	cFm+IofU=
X-Google-Smtp-Source: AGHT+IE/PNaxjGzCGUA8x8lnBqfAwRNWBA9GZwlQ/SR6BdSFyyiJ5mbCBRrkDDXhoBU/zD2+AVd2tw==
X-Received: by 2002:a05:600c:4f06:b0:43d:47b7:b32d with SMTP id 5b1f17b1804b1-441b1f5bffamr18303925e9.25.1746007104070;
        Wed, 30 Apr 2025 02:58:24 -0700 (PDT)
Received: from localhost (p200300f65f00780800000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f00:7808::1b9])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-441b276052bsm19509835e9.0.2025.04.30.02.58.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 02:58:23 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org,
	linux-pwm@vger.kernel.org
Subject: [PATCH 4/4] clk: pwm: Make use of non-sleeping PWMs
Date: Wed, 30 Apr 2025 11:57:49 +0200
Message-ID:  <d2f748101194409fb410711380ea52ed33260644.1746006578.git.ukleinek@baylibre.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.1746006578.git.ukleinek@baylibre.com>
References: <cover.1746006578.git.ukleinek@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2034; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=QdSfLwYCjEBwVvV1+m4B+Wh80A5f4PCVAxEhB2M5NWE=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBoEfQlFYNVFV0uSdvYRNM4cLtkRu2hwMZMbaNQm RHztf4oHSmJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaBH0JQAKCRCPgPtYfRL+ TvpeB/9yLr9vmRm3oSXrChXLoKpqKUwW8zmYaKJAXtT7OpTK/dwrsZlCXW9YII4UbOdPThxEWsq 05ldADUvm8dfiPogXiJll4sZmNmLiLN8zgfccka8pXUAGR6FkA81tGXp97Lde0lu0t7c9DwNfmG mfuWHTrKSfxyqvV2RGxvyt7BGt+D4tsoUQM2RV5d+S7r3lIWLifygE0/bVMdP4Ma8LeVJaBIqoe rM4bBNuRlrKOQXB8hqEeQrxPYaEihaerJFMhqdqU3epE9SuOKD+aHpdky7cBc/HITHzA170Mh3X 86HWHDv5r2CA+L8DSGUkBrmyJ55DqzNNRTdKl53UpOxh5Y0I
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

For some PWMs applying a configuration doesn't sleep. For these enabling
and disabling can be done in the clk callbacks .enable() and .disable()
instead of .prepare() and .unprepare().

Do that to possibly reduce the time the PWM is enabled and so save some
energy.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/clk/clk-pwm.c | 30 +++++++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk-pwm.c b/drivers/clk/clk-pwm.c
index 856828d5f58c..4709f0338e37 100644
--- a/drivers/clk/clk-pwm.c
+++ b/drivers/clk/clk-pwm.c
@@ -23,6 +23,23 @@ static inline struct clk_pwm *to_clk_pwm(struct clk_hw *hw)
 	return container_of(hw, struct clk_pwm, hw);
 }
 
+static int clk_pwm_enable(struct clk_hw *hw)
+{
+	struct clk_pwm *clk_pwm = to_clk_pwm(hw);
+
+	return pwm_apply_atomic(clk_pwm->pwm, &clk_pwm->state);
+}
+
+static void clk_pwm_disable(struct clk_hw *hw)
+{
+	struct clk_pwm *clk_pwm = to_clk_pwm(hw);
+	struct pwm_state state = clk_pwm->state;
+
+	state.enabled = false;
+
+	pwm_apply_atomic(clk_pwm->pwm, &state);
+}
+
 static int clk_pwm_prepare(struct clk_hw *hw)
 {
 	struct clk_pwm *clk_pwm = to_clk_pwm(hw);
@@ -61,6 +78,13 @@ static int clk_pwm_get_duty_cycle(struct clk_hw *hw, struct clk_duty *duty)
 	return 0;
 }
 
+static const struct clk_ops clk_pwm_ops_atomic = {
+	.enable = clk_pwm_enable,
+	.disable = clk_pwm_disable,
+	.recalc_rate = clk_pwm_recalc_rate,
+	.get_duty_cycle = clk_pwm_get_duty_cycle,
+};
+
 static const struct clk_ops clk_pwm_ops = {
 	.prepare = clk_pwm_prepare,
 	.unprepare = clk_pwm_unprepare,
@@ -115,7 +139,11 @@ static int clk_pwm_probe(struct platform_device *pdev)
 	of_property_read_string(node, "clock-output-names", &clk_name);
 
 	init.name = clk_name;
-	init.ops = &clk_pwm_ops;
+	if (pwm_might_sleep(pwm))
+		init.ops = &clk_pwm_ops;
+	else
+		init.ops = &clk_pwm_ops_atomic;
+
 	init.flags = 0;
 	init.num_parents = 0;
 
-- 
2.47.2


