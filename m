Return-Path: <linux-clk+bounces-4858-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9A48859FB
	for <lists+linux-clk@lfdr.de>; Thu, 21 Mar 2024 14:34:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5EDDE1C209CC
	for <lists+linux-clk@lfdr.de>; Thu, 21 Mar 2024 13:34:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADC7984A4D;
	Thu, 21 Mar 2024 13:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nQSi3vn9"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03E0E84A37
	for <linux-clk@vger.kernel.org>; Thu, 21 Mar 2024 13:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711028051; cv=none; b=go11ngjrmvUzLdejxyozQcsgIxxSFpvnNpfhjAmKLk7N+DFzShVXa2W5nc25QxwIaMUiaJ7IOIdHAXqStvRT2wJIHzh7CjlRkJqQygHYrbQLSmSIvrO5XFV/zN71QkjW2ojt1vabwTR0DhwFo0Ua/rwauR+gbqZnLCfnQsINF2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711028051; c=relaxed/simple;
	bh=4rGCuazBqIHOXvtaI7Wo0zKZRsaUt8SJwAl/0Nh+JqU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=da8bJiMp4YEQG+CKf7TTGhsp3gdvZ7u7guScUiRUxogGt2dBdD0V5ZGZyqegeIi0seQps0Dyc7Z3xs77dlXq5fLTRJaVpsDtciMHt03bwqTbRQBZLjgOm2If4DaHgDsp7NfWdHK786CN5ug8YSrq31RSb01CVSLrrbEDplIADvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nQSi3vn9; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-dcbc6a6808fso897800276.2
        for <linux-clk@vger.kernel.org>; Thu, 21 Mar 2024 06:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711028049; x=1711632849; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=b7bxt9nrUotSd041Jk9I1N2RXEe6VR/TERlrPfMUlBo=;
        b=nQSi3vn9h0FL9kh8bQkPn9T1yNjHOzCo5t9fjNdr17TTF7fHN5v30Nlu9IJHmw9fly
         Cy7MegFn3QHB6an27Y0mqPN2xq7CLocQPdLWTAkHnbEoQIgAyGScU7XQ6Bp3Byq+Ulhc
         +M6UGsE8y9MztGW7usVFo9u9XVWy57gF9GD96St8ZAIJzGJiL/2A3sxT6iy6Xo8KVosG
         4Lz6wiwWW3Utrn+bpJd/IU0nKK5Bg/QfJVRwVjNV4UFbrT1XqvGNcc76iP3kIFUD6dUy
         CB+i4SiU4XDHhLESM5U0fuNTG8epRi6SG4tzs8vhXtpDY+hPcnHoV3KMxXEcM11BS8i1
         H4Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711028049; x=1711632849;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b7bxt9nrUotSd041Jk9I1N2RXEe6VR/TERlrPfMUlBo=;
        b=cFlKUUhf/ST+hP8sqaiBwKsSi0FJxmKxMreaATNwekV3jP5YqBYL4kxrQA2H9nInzP
         h3+H04h+eOsExo5Y9np4igVowziLqUyglwJ4SB0XG2DGGWq1tSQzvrA7UyKVPLxA8Gvu
         DDH30fgDVZJDQicPpPhYuvR/k6IHMazecKL+eNG566o36Dsjxgag6FxGD5sI/8LliyGn
         45E2SbPki/dPxXog73bM++R6Wor3wu3SAkLyTJnPzXs7c7hr8fECS8sAOJaUaTuySzq8
         SurGs34rv5uoXm6MJlHOwD4Y6uWO+jnuc1GFoOhjLnChaKX5b1M3qSF13m36CLkDkRBg
         MXnA==
X-Forwarded-Encrypted: i=1; AJvYcCWqN3FwqgZmx9wdR+zBcdphbm0Zs0Pg5W78vZvaRVItO/BYrtAXCc6xhdKPlwfqoN16D1PEHSHmC9SWVPVaUQiz3ejvm2r79eJc
X-Gm-Message-State: AOJu0Yw1u9g1aGZ/kg3U3eL0XuLNaTI7T/UH7EIyAzMLFF/dU1p1ju6z
	Kijabrf7TOWBtbhUXwY8YDsYmTuSXHO41cxomxj/8QWC4rxwtDMs3hcLN4A9uXEKC6uBRqYn5aQ
	AY9oKkFfYoFjKX8d543NLlD/AoYeFDd6Zq8X9bg==
X-Google-Smtp-Source: AGHT+IEMV70cy2lfVctFclzg46XTHw7b9TCUBAofP7jsI4yCoZ9ytwZlQ3WAG5PxiT1bzKqOtfrpUpK2FbkGF4MjIas=
X-Received: by 2002:a05:6902:2305:b0:dcd:24b6:1aee with SMTP id
 do5-20020a056902230500b00dcd24b61aeemr9277695ybb.47.1711028049057; Thu, 21
 Mar 2024 06:34:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240321-apss-ipq-pll-cleanup-v2-0-201f3cf79fd4@gmail.com> <20240321-apss-ipq-pll-cleanup-v2-2-201f3cf79fd4@gmail.com>
In-Reply-To: <20240321-apss-ipq-pll-cleanup-v2-2-201f3cf79fd4@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 21 Mar 2024 15:33:57 +0200
Message-ID: <CAA8EJpqqDBQTLmrit33n5XoqVOP05Ts=C5xLr2qOwhPSA8rMuw@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] clk: qcom: apss-ipq-pll: move Huayra register map
 to 'clk_alpha_pll_regs'
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 21 Mar 2024 at 09:50, Gabor Juhos <j4g8y7@gmail.com> wrote:
>
> Move the locally defined Huayra register map to 'clk_alpha_pll_regs'
> in order to allow using that by other drivers, like the clk-cbf-8996.
>
> No functional changes.
>
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
> ---
> Changes in v2:
>  - rework the patch as requested by Dmitry Baryshkov by moving the register
>    map into clk-alpha-pll.c instead of keeping that locally
>  - Link to v1: https://lore.kernel.org/r/20240318-apss-ipq-pll-cleanup-v1-2-52f795429d5d@gmail.com
> ---
>  drivers/clk/qcom/apss-ipq-pll.c  | 20 +-------------------
>  drivers/clk/qcom/clk-alpha-pll.c | 10 ++++++++++
>  drivers/clk/qcom/clk-alpha-pll.h |  1 +
>  3 files changed, 12 insertions(+), 19 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

