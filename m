Return-Path: <linux-clk+bounces-1793-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D38F181A77D
	for <lists+linux-clk@lfdr.de>; Wed, 20 Dec 2023 21:07:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EA12A1C22FF5
	for <lists+linux-clk@lfdr.de>; Wed, 20 Dec 2023 20:07:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B92B0487A2;
	Wed, 20 Dec 2023 20:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XdYzkPQU"
X-Original-To: linux-clk@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94CB34879C;
	Wed, 20 Dec 2023 20:07:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCFC1C433C9;
	Wed, 20 Dec 2023 20:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703102860;
	bh=I8ZJDqp5eNo74J5gktMHo6oHsM5qqMxm0Pus3JKGU+8=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=XdYzkPQU93NbIfebSUJNiZILeSdnjT52dOrh4lO3b0TzGqpThMZvJ8KzRFhFH7/58
	 67U8v90dARir0lQ+vJt9Nt5RojG0A/y3t8NPhnZ0bnyzhoyTg4piLDo40+8IBbeg9d
	 5sagM8iDGokbFL6ykMHEumM1T+/DppF493II24qqJ8hSHaXvZ++kirXgYzCi6bZ25A
	 J9fvLAgUz0mu+iiYjdC3tqLUkqA5kBOcWCC77aKqPj1fMhPOep6ToFAV/mHK902y3c
	 s6AEGKsCvh4JR2pKJtK10qvck6spXmqxAtKHCfQOn5w/Tpa+1UHUiY6Hn59/+LHsSy
	 q3RJg0n4lB98w==
Message-ID: <5bcc0bafc1c31ca4902b9b574f02625d.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20231124151847.1915-2-ansuelsmth@gmail.com>
References: <20231124151847.1915-1-ansuelsmth@gmail.com> <20231124151847.1915-2-ansuelsmth@gmail.com>
Subject: Re: [PATCH v7 1/3] clk: qcom: clk-rcg: introduce support for multiple conf for same freq
From: Stephen Boyd <sboyd@kernel.org>
Cc: Christian Marangi <ansuelsmth@gmail.com>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Christian Marangi <ansuelsmth@gmail.com>, Konrad Dybcio <konrad.dybcio@linaro.org>, Michael Turquette <mturquette@baylibre.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Wed, 20 Dec 2023 12:07:37 -0800
User-Agent: alot/0.10

Quoting Christian Marangi (2023-11-24 07:18:45)
> diff --git a/drivers/clk/qcom/clk-rcg.h b/drivers/clk/qcom/clk-rcg.h
> index e6d84c8c7989..c81458db6ce4 100644
> --- a/drivers/clk/qcom/clk-rcg.h
> +++ b/drivers/clk/qcom/clk-rcg.h
> @@ -17,6 +17,23 @@ struct freq_tbl {
>         u16 n;
>  };
> =20
> +#define C(s, h, m, n) { (s), (2 * (h) - 1), (m), (n) }
> +#define FM(f, confs) { (f), ARRAY_SIZE(confs), (confs) }
> +#define FMS(f, s, h, m, n) { (f), 1, (const struct freq_conf []){ C(s, h=
, m, n) } }
> +
> +struct freq_conf {
> +       u8 src;
> +       u8 pre_div;
> +       u16 m;
> +       u16 n;
> +};
> +
> +struct freq_multi_tbl {
> +       unsigned long freq;
> +       int num_confs;

size_t?

> +       const struct freq_conf *confs;
> +};
> +
>  /**
>   * struct mn - M/N:D counter
>   * @mnctr_en_bit: bit to enable mn counter

