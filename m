Return-Path: <linux-clk+bounces-4758-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD7987EB2E
	for <lists+linux-clk@lfdr.de>; Mon, 18 Mar 2024 15:40:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D770AB219DA
	for <lists+linux-clk@lfdr.de>; Mon, 18 Mar 2024 14:40:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A7734E1C9;
	Mon, 18 Mar 2024 14:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GLIqyO0N"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A9F44E1BC
	for <linux-clk@vger.kernel.org>; Mon, 18 Mar 2024 14:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710772807; cv=none; b=cmKGbDVpDDBYtuZcYrCzAkiYo1KUe+4G8OUfiQe2SU/Pto12eEThd3SLAA0b/ScmKy/eFyE8fBOHr2o0OkKlr54SUNLWIznn214B0MF38IFVltyGtArJaTp8crprGm0DetXBfFKOVeGAO1daXJ4Vp6OOvPMjFF2RNuofCauO3aU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710772807; c=relaxed/simple;
	bh=IlAC/UAQd5MXYjl273/a718EIOUzFR+4LkQzxMq+JaI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R4Xh3TjA7CKJI2rBRUwDuYLfmlORHcYGsu1avDCz+dWMoPv+xQhCm9VHF+VcW8MgvkBR7/gOsEdMUrdw9hSS3LHT6CZzepyPLB1QO+TLrxS8k+593yOAD+yWGgSReCDDtAwcYumYUtnp8uWDBSdx6Yi0KGaXasIRNQ4dp05d0UU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GLIqyO0N; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-dcbcea9c261so4163900276.3
        for <linux-clk@vger.kernel.org>; Mon, 18 Mar 2024 07:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710772804; x=1711377604; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZMlNnEWOpYXUGBNsiFKWdAeOcGOvC9+fZTDj9HH/epI=;
        b=GLIqyO0NvbL6PtO9o/EISigaWGlmuZL/GrUApo/Dx7ucAbvJe+w+REXvhJXsxRSPQs
         fPsrG7uRLH8+IX+ZfOKzlfFLlZx4So4e9j5nEWAc2ResSzjzwunIBEquRsPHIiG2Au/E
         4jV0ZfNpT785PnMtjuyLDshMr9dMymP5sbqeePy2rRcqCDGzew63xaDk9CAgbdb/Kczg
         BgIoNO+DqNv6ow7HCc7t2vqHqfHsbTZRb85SQMoTf4IxiRpOwtUF9TMWLrD3+KxdX4AE
         brJXb/8xsmh6W7VxzOGR+eG3tneKsgHasgdOp0BefistIY+anu8TNQGHOZin5ZqffUyj
         WxLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710772804; x=1711377604;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZMlNnEWOpYXUGBNsiFKWdAeOcGOvC9+fZTDj9HH/epI=;
        b=PVRWhe0DYstKQLtaQe0nF118ciEBoXqHi9pxQb07M2ROpv1pZW07gdCG5YxLsBwNic
         2L309ZkJ3dCXZoD4g2qj2doKbZGqKo3gAHjpgIBLeBLbfwzyx761J1GAoMWAIc9iU4hM
         CgwpAN3j8RYvsRqW5thGv+AIakBmrle3qvWEGO4oBXNCJeA8MXmwCw6HCJ4r6S8RFj7y
         09gMl/Wya997y0ZgUJQ8QpjNBYv6psfdLs67N+b6QrgwpTBU4dJ07GSSNyoJgkCyHcEI
         4StljPu2SG2BrqhKZvbUSNhlGCVKmqUOHMAtU2J9AjOUz4t8D4IPR+x8UzRNyFlERePM
         k17g==
X-Forwarded-Encrypted: i=1; AJvYcCX8Cbw05qJZEJ7C3HQJqwOJWY1Sm1yo6kugTWAa7FuRNeD2kEVNzsH1mfAjZas88bO/xbt3SB7wq4j3Ta2ymczJrsWzVBC9bdfz
X-Gm-Message-State: AOJu0Yytl22J+jM98Meh2wHGAQADWnrO6j9p9IjZRjYOMNcJcjaGkRPA
	WUzN3qxpfdccNlL7u/Hlwmo291kGy2uOlv2LtcgljrpM1/S+mKBdZacYVb0gpT4TdOr4E46HkwZ
	3UYXcufbeB5oYYxr0LF26DhAsyOEmBqDsK/uEcA==
X-Google-Smtp-Source: AGHT+IEThwYsQiTWbzhJyLQT2bhri6zZ5h4WE+yPw/QIQxHFbJAdyafw0GpF8nLkJuL6ZdTQ3mAeQhmXFW/TggAVm3M=
X-Received: by 2002:a05:6902:100a:b0:dd9:20d6:fd2 with SMTP id
 w10-20020a056902100a00b00dd920d60fd2mr2336963ybt.27.1710772804148; Mon, 18
 Mar 2024 07:40:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240315111046.22136-1-quic_jkona@quicinc.com>
In-Reply-To: <20240315111046.22136-1-quic_jkona@quicinc.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 18 Mar 2024 15:39:27 +0100
Message-ID: <CAPDyKFpOobCrmeeTaFhnwMMhoWGKC6qz9851VjVoDP2fBZEUzA@mail.gmail.com>
Subject: Re: [PATCH V5 0/5] PM: domains: Add control for switching back and
 forth to HW control
To: Jagadeesh Kona <quic_jkona@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Abel Vesa <abel.vesa@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

- trimmed cc list

On Fri, 15 Mar 2024 at 12:11, Jagadeesh Kona <quic_jkona@quicinc.com> wrote:
>
> This series adds support for dev_pm_genpd_set_hwmode() and dev_pm_genpd_get_hwmode() APIs
> and support in gdsc provider drivers to register respective callbacks and venus consumer
> driver example using above API to switch the power domain(GDSC) to HW/SW modes dynamically
> at runtime.
>
> Changes in V5:
> - Updated 1st patch as per V4 review comments to synchronize the initial HW mode state by
>   invoking ->get_hwmode_dev()callback in genpd_add_device()
> - With above change, SW cached hwmode will contain correct value initially, and it will be
>   updated everytime mode is changed in set_hwmode, hence updated dev_pm_genpd_get_hwmode()
>   to just return SW cached hwmode in 1st patch
> - Updated commit text for 1st, 3rd, 4th and 5th patches
> - Updated 3rd and 5th patches as per review comments received on V4 series
> - Added R-By tags received in older series to 1st and 2nd patches
>
> Previous series:
> V4: https://lore.kernel.org/all/20240122-gdsc-hwctrl-v4-0-9061e8a7aa07@linaro.org/
> V3: https://lore.kernel.org/lkml/20230823114528.3677667-1-abel.vesa@linaro.org/
> V2: https://lore.kernel.org/lkml/20230816145741.1472721-1-abel.vesa@linaro.org/
> V1: https://lore.kernel.org/all/20230628105652.1670316-1-abel.vesa@linaro.org/
>
> Abel Vesa (1):
>   PM: domains: Add the domain HW-managed mode to the summary
>
> Jagadeesh Kona (3):
>   clk: qcom: gdsc: Add set and get hwmode callbacks to switch GDSC mode
>   clk: qcom: Use HW_CTRL_TRIGGER flag to switch video GDSC to HW mode
>   venus: pm_helpers: Use dev_pm_genpd_set_hwmode to switch GDSC mode on
>     V6
>
> Ulf Hansson (1):
>   PM: domains: Allow devices attached to genpd to be managed by HW
>
>  drivers/clk/qcom/gdsc.c                       | 37 +++++++++
>  drivers/clk/qcom/gdsc.h                       |  1 +
>  drivers/clk/qcom/videocc-sc7280.c             |  2 +-
>  drivers/clk/qcom/videocc-sm8250.c             |  4 +-
>  .../media/platform/qcom/venus/pm_helpers.c    | 39 ++++++----
>  drivers/pmdomain/core.c                       | 78 ++++++++++++++++++-
>  include/linux/pm_domain.h                     | 17 ++++
>  7 files changed, 157 insertions(+), 21 deletions(-)
>

This looks good to me! I can help to funnel the series through my
pmdomain tree, if that's the preferred route? Bjorn/Konrad, please let
me know.

Kind regards
Uffe

