Return-Path: <linux-clk+bounces-1213-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC2680DC56
	for <lists+linux-clk@lfdr.de>; Mon, 11 Dec 2023 22:02:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 289F41F21BC1
	for <lists+linux-clk@lfdr.de>; Mon, 11 Dec 2023 21:02:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D3DE54BE5;
	Mon, 11 Dec 2023 21:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P/w7G0Wj"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A890DD1
	for <linux-clk@vger.kernel.org>; Mon, 11 Dec 2023 13:02:33 -0800 (PST)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-5d2d0661a8dso49361087b3.2
        for <linux-clk@vger.kernel.org>; Mon, 11 Dec 2023 13:02:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702328553; x=1702933353; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cZfsZrrRBlZwfErbKCDlnyMZePAWlHxlE0E9UWOYGmQ=;
        b=P/w7G0WjSFdG4l3M3g02vvLEnBwqml1AyvE2NiC1NCLAynYfl1BMPYI3oV+Ch/cMDk
         tI9Jb9aSKXXSvTPAJO6QG5J8jHRWZ8kZ0zWUf9Lzgjo7kjeUEyQZo51b+YVri6SqOLUT
         ZLWZHQWvLskk05QRZsBxBrcHngBOi2nLjxH0dLomEeeHv84Q9IhAcr9kzQlCJ8YFYRoF
         TNv7sjkbbL0JrrhylrAYlK0u+vEFl5wXqBWMzdgk0KST6a8Wc3aIdro35AcA2Xyx3JW9
         joFnb7/ESr+prdztc5JC//6ur24+npmd9CDLu3dJzjZ9jyccf2WotzpNsC5k9qrm7F5G
         gxTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702328553; x=1702933353;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cZfsZrrRBlZwfErbKCDlnyMZePAWlHxlE0E9UWOYGmQ=;
        b=blWsBj0k0Pay44gfv9GtCjeOJZgDMU+4gCuv5D1f3d4AitlKcaJAZZGx7tZbtJYsEe
         9ohnj5qGVj38qftxLUOeGGnTNo7Sz1je3stBK57YoLzXcAyt3RJqIquvp/sfpzwialng
         khHsB2XNeJcZYayCO3hSTUHoOYxUHrwpJOCg9Ohbq3wcI4H74pNmddlit0FsL/dgEuTZ
         j7YPhVBDLeJIroQOjc2miLr7HmDNmZcrufIui+dAFWM0M7QDwjcBf0HGum8XSUNk6B69
         RdJUc2UOAnWouitQk4aIARbtIi4q8PdVDFTRcKQhHpMDeZJHGiDaw8eSl9hcjuk2Q2iO
         P8Ig==
X-Gm-Message-State: AOJu0Yx0jrSBC5+TcBLH8+AbzOgCLfaR3Sjw4FrPo7MasnrZWAEkR3HQ
	J2f7KVDlhhQKZmxHB7rKmnADHAeIqryMFgeGNkbSUA==
X-Google-Smtp-Source: AGHT+IEx7mNSHR0hv8E+Jx+J+xIQnLDD997azEZuKMXEYCvggtMUMZoyCLaTgxmHG3TvQOqT3+BfMVSbsiM6LZX48/o=
X-Received: by 2002:a0d:f842:0:b0:5d7:1940:b377 with SMTP id
 i63-20020a0df842000000b005d71940b377mr3838384ywf.67.1702328552858; Mon, 11
 Dec 2023 13:02:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231211162331.435900-1-peter.griffin@linaro.org> <20231211162331.435900-10-peter.griffin@linaro.org>
In-Reply-To: <20231211162331.435900-10-peter.griffin@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 11 Dec 2023 22:02:21 +0100
Message-ID: <CACRpkda8LJS+9dPQFqQLFDbj=gvJ9rKSu=ECczDB4QUv+FZgnw@mail.gmail.com>
Subject: Re: [PATCH v7 09/16] pinctrl: samsung: Add gs101 SoC pinctrl configuration
To: Peter Griffin <peter.griffin@linaro.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org, 
	tomasz.figa@gmail.com, s.nawrocki@samsung.com, wim@linux-watchdog.org, 
	linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de, 
	olof@lixom.net, gregkh@linuxfoundation.org, jirislaby@kernel.org, 
	cw00.choi@samsung.com, alim.akhtar@samsung.com, tudor.ambarus@linaro.org, 
	andre.draszik@linaro.org, semen.protsenko@linaro.org, saravanak@google.com, 
	willmcvicker@google.com, soc@kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, kernel-team@android.com, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 11, 2023 at 5:24=E2=80=AFPM Peter Griffin <peter.griffin@linaro=
.org> wrote:

> Add support for the pin-controller found on the gs101 SoC used in
> Pixel 6 phones.
>
> Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>

Looks good to me.
Acked-by: Linus Walleij <linus.walleij@linaro.org>

I expect Krzysztof to merge this when he feels it is ready and
send to me by pull request.

Yours,
Linus Walleij

